//
//  CZHTTP.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/28.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZHTTP.h"
#import <AFNetworking.h>
#import "CZLog.h"

NSString *const CZHTTPMsg = @"errMsg";
NSString *const CZHTTPCode = @"status";
NSString *const CZHTTPData = @"result";

#define CZ_HTTP_HOST @"http://localhost:8082"

@interface CZHTTP()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;//网络请求管理
@property (nonatomic, copy) NSDictionary *commonParams;
@end

@implementation CZHTTP

CZ_SINGLETON_IMPLEMENTATION(CZHTTP)

-(id)init {
    self = [super init];
    if (self) {
        self.sessionManager = [[AFHTTPSessionManager alloc] init];
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [self.sessionManager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        self.sessionManager.responseSerializer.acceptableContentTypes = [self.sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
        self.sessionManager.responseSerializer.acceptableContentTypes = [self.sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        //添加支持
        //        self.sessionManager.securityPolicy.allowInvalidCertificates = NO;
        // 证书
        //        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"cer"];
        //        NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
        //        NSSet *cerSet = [[NSSet alloc]initWithObjects:cerData, nil];
        //        AFSecurityPolicy *securityPoliy = [AFSecurityPolicy defaultPolicy];
        //        //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
        //        //如果是需要验证自建证书，需要设置为YES
        //        securityPoliy.allowInvalidCertificates = YES;
        //        securityPoliy.validatesDomainName = NO;
        //        //设置证书
        //        [securityPoliy setPinnedCertificates:cerSet];
        //        [self.sessionManager setSecurityPolicy:securityPoliy];
        
        self.commonParams = @{};
        
    }
    return self;
}


/*! 通用处理返回数据 */
-(void)processResponse:(id)response
                  task:(NSURLSessionDataTask *)task
               success:(void(^)(NSURLSessionDataTask *task,id response))success
               failure:(void(^)(NSURLSessionDataTask *task,id response))failure {
    CZLogInfo(@"response: %@", response);
    if (task.error.code) {
        NSString *code = [NSString stringWithFormat:@"%ld",task.error.code];
        CZLogWarn(@"请求错误：code:%ld, msg:%@",task.error.code, task.error.localizedDescription);
        if (failure) { failure(task,@{CZHTTPCode:code, CZHTTPMsg:task.error.localizedDescription}); }
        
    } else {
        NSDictionary *responseDic = (NSDictionary *)response;
        if ([responseDic isKindOfClass:[NSDictionary class]]) {
            id errcode = responseDic[CZHTTPCode];
            if ([errcode isKindOfClass:[NSString class]] && [((NSString *)errcode) isEqualToString:@"0"]) {
                if (success) { success(task, responseDic[CZHTTPData]); }
                
            }else if ([errcode isKindOfClass:[NSNumber class]] && ((NSNumber *)errcode).integerValue == 0) {                    if (success) { success(task, responseDic[CZHTTPData]); }
                
            } else {
                NSString *errMsg = responseDic[CZHTTPMsg];
                if (![errMsg isKindOfClass:[NSString class]]) {
                    errMsg = @"服务数据异常";
                }
                CZLogWarn(@"请求错误：msg:请求服务操作失败");
                if (failure) { failure(task, @{CZHTTPMsg:errMsg, CZHTTPCode:@"401"}); }
            }
            
        } else {
            CZLogWarn(@"请求错误：msg:返回数据结构不正确");
            if (failure) { failure(task, @{CZHTTPMsg:@"网络通信错误", CZHTTPCode:@"500"}); }
        }
    }
}

// 通用 post 请求处理
- (void)post_requestWithURLString:(NSString *)URLString
                          paramas:(NSDictionary *)paramas
                         progress:(void (^)(NSProgress *))progress
                          success:(CZHTTPBlock)success
                          failure:(CZHTTPBlock)failure {
    CZLogInfo(@"post 请求 url:%@\n参数：\n%@", URLString, paramas);
    [self.sessionManager POST:URLString parameters:paramas progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processResponse:responseObject task:task success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processResponse:task.response task:task success:success failure:failure];
    }];
}

// 通用 get 请求处理
- (void)get_requestWithURLString:(NSString *)URLString
                         paramas:(NSDictionary *)paramas
                        progress:(void (^)(NSProgress *))progress
                         success:(CZHTTPBlock)success
                         failure:(CZHTTPBlock)failure {
    CZLogInfo(@"get 请求 url:%@\n参数：\n%@", URLString, paramas);
    [self.sessionManager GET:URLString parameters:paramas progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self processResponse:responseObject task:task success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self processResponse:task.response task:task success:success failure:failure];
    }];
}

- (NSString *)httpRequestUrlWithPath:(NSString *)path {
    return [NSString stringWithFormat:@"%@%@", CZ_HTTP_HOST, path];
}

#pragma mark - API

- (void)post_LoginWithUsername:(NSString *)username
                       success:(CZHTTPBlock)success
                       failure:(CZHTTPBlock)failure {
    NSString *path = @"/myServer/project/shoppingCart/search.php";
    NSString *url = [self httpRequestUrlWithPath:path];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] initWithDictionary:self.commonParams];
    [params cz_addUnEmptyObj:username forKey:@"name"];
    
    [self post_requestWithURLString:url paramas:params progress:nil success:success failure:failure];
}

#pragma mark - Getter

- (NSDictionary *)commonParams {
    _commonParams = @{@"token": [NSString stringWithFormat:@"%u", arc4random()%100]};
    
    return _commonParams;
}

@end
