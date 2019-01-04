//
//  CZUMTool.m
//  CZLibrary
//
//  Created by juyiwei on 2018/11/1.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZUMTool.h"
#import "CZLibraryMacro.h"

@implementation CZUMTool

#pragma mark - 统一配置

+ (void)cz_configWithAppkey:(NSString *)appKey {
    
#ifdef DEBUG
    [UMConfigure setLogEnabled:NO];
    [UMCommonLogManager setUpUMCommonLogManager];
#else
    [UMConfigure setLogEnabled:NO];
#endif
    
    [UMConfigure setEncryptEnabled:YES];
    [UMConfigure initWithAppkey:appKey channel:@"App Store"];
}

#pragma mark - 统计

+ (void)cz_event:(NSString *)eventId {
    [MobClick event:eventId];
}

#pragma mark - 分享

+ (BOOL)cz_configShareGlobal {
    [UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    
    return YES;
}

+ (void)cz_configShareWechatAppkey:(NSString *)appkey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL {
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:appkey appSecret:appSecret redirectURL:redirectURL];
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
}

+ (void)cz_configShareQQAppkey:(NSString *)appkey redirectURL:(NSString *)redirectURL {
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:appkey appSecret:nil redirectURL:redirectURL];
}

#pragma mark - 第三方登录

+ (void)cz_getUserInfoForPlatform:(UMSocialPlatformType)platformType success:(void(^)(UMSocialUserInfoResponse *response))success failure:(void(^)(id response, NSError *error))failure {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:nil completion:^(id result, NSError *error) {
        
        if (error) {
            if (failure) {
                failure(result, error);
            }
            
        } else {
            if ([result isKindOfClass:[UMSocialUserInfoResponse class]]) {
                if (success) {
                    success(result);
                }
            } else {
                if (failure) {
                    failure(result, [NSError errorWithDomain:CZLibraryErrorDomain code:999999 userInfo:@{@"message":@"数据结构异常"}]);
                }
            }
        }
    }];
}

@end


@implementation UIViewController (czShare)

// 通用分享
- (void)cz_generalShareToPlatformType:(UMSocialPlatformType)platformType messageObject:(UMSocialMessageObject *)messageObject success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure {
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            if (failure) {
                failure(data, error);
            }
            
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                if (success) {
                    success(resp);
                }
                
            }else{
                if (failure) {
                    failure(data, [NSError errorWithDomain:CZLibraryErrorDomain code:999999 userInfo:@{@"message":@"数据结构异常"}]);
                }
            }
        }
    }];
}

- (void)cz_shareText:(NSString *)text platformType:(UMSocialPlatformType)platformType success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure {
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.text = text;
    [self cz_generalShareToPlatformType:platformType messageObject:messageObject success:success failure:failure];
}

- (void)cz_shareImage:(id)image thumbImage:(id)thumbImage ToPlatformType:(UMSocialPlatformType)platformType success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure{
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    shareObject.thumbImage = thumbImage;
    shareObject.shareImage = image;
    messageObject.shareObject = shareObject;
    [self cz_generalShareToPlatformType:platformType messageObject:messageObject success:success failure:failure];
}

- (void)cz_shareWebPageToPlatformType:(UMSocialPlatformType)platformType thumbImage:(id)thumbImage title:(NSString *)title message:(NSString *)message webUrl:(NSString *)webUrl success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure {
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:message thumImage:thumbImage];
    shareObject.webpageUrl = webUrl;
    messageObject.shareObject = shareObject;
    
    [self cz_generalShareToPlatformType:platformType messageObject:messageObject success:success failure:failure];
}


@end
