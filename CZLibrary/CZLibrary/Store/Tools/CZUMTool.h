//
//  CZUMTool.h
//  CZLibrary
//
//  Created by juyiwei on 2018/11/1.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
#import <UMAnalytics/MobClick.h>
#import <UMShare/UMShare.h>
#import <UShareUI/UShareUI.h>
#import <UMPush/UMessage.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZUMTool : NSObject

/**
 统一基本配置
 
 @param appKey appKey
 */
+ (void)cz_configWithAppkey:(NSString *)appKey;

#pragma mark - 统计

/**
 埋点统计，此处使用 友盟统计
 
 @param eventId 事件 ID
 */
+ (void)cz_event:(NSString *)eventId;

#pragma mark - 分享

/**
 分享公共配置

 @return return value description
 */
+ (BOOL)cz_configShareGlobal;

/**
 配置微信分享

 @param appkey appkey description
 @param appSecret appSecret description
 @param redirectURL redirectURL description
 */
+ (void)cz_configShareWechatAppkey:(NSString *)appkey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL;

/**
 配置 QQ 分享

 @param appkey appkey description
 @param redirectURL redirectURL description
 */
+ (void)cz_configShareQQAppkey:(NSString *)appkey redirectURL:(NSString *)redirectURL;

#pragma mark - 第三方登录

/**
 第三方登录

 @param platformType platformType description
 @param success success description
 @param failure failure description
 */
+ (void)cz_getUserInfoForPlatform:(UMSocialPlatformType)platformType success:(void(^)(UMSocialUserInfoResponse *response))success failure:(void(^)(id response, NSError *error))failure;


@end


@interface UIViewController (czShare)

- (void)cz_shareText:(NSString *)text platformType:(UMSocialPlatformType)platformType success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure;

- (void)cz_shareImage:(id)image thumbImage:(id)thumbImage ToPlatformType:(UMSocialPlatformType)platformType success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure;

- (void)cz_shareWebPageToPlatformType:(UMSocialPlatformType)platformType thumbImage:(id)thumbImage title:(NSString *)title message:(NSString *)message webUrl:(NSString *)webUrl success:(void(^)(UMSocialShareResponse *response))success failure:(void(^)(id response, NSError *error))failure;

@end


NS_ASSUME_NONNULL_END
