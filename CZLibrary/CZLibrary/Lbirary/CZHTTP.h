//
//  CZHTTP.h
//  CZLibrary
//
//  Created by juyiwei on 2018/9/28.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableDictionary+cz.h"
#import "CZLibraryMacro.h"

typedef void(^ CZHTTPBlock)(NSURLSessionDataTask *operation,id response);
typedef void(^ CZHTTPProgress)(NSProgress *progress);

@interface CZHTTP : NSObject

CZ_SINGLETON_HEADER(CZHTTP)

/**
 通用参数
 */
@property (nonatomic, copy) NSDictionary *commonParams;

/**
 配置请求返回通用格式的 key值

 @param code code description
 @param data data description
 @param message message description
 */
- (void)cz_configWithResponseDataCodeKey:(NSString *)code
                              dataKey:(NSString *)data
                           messageKey:(NSString *)message;

/**
 通用 post 请求

 @param URLString URLString description
 @param paramas paramas description
 @param progress progress description
 @param success success description
 @param failure failure description
 */
- (void)cz_post_requestWithURLString:(NSString *)URLString
                          paramas:(NSDictionary *)paramas
                         progress:(void (^)(NSProgress *))progress
                          success:(CZHTTPBlock)success
                          failure:(CZHTTPBlock)failure;

/**
 通用 get 请求
 
 @param URLString URLString description
 @param paramas paramas description
 @param progress progress description
 @param success success description
 @param failure failure description
 */
- (void)cz_get_requestWithURLString:(NSString *)URLString
                         paramas:(NSDictionary *)paramas
                        progress:(void (^)(NSProgress *))progress
                         success:(CZHTTPBlock)success
                         failure:(CZHTTPBlock)failure;


@end
