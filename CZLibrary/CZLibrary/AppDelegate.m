//
//  AppDelegate.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/19.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "AppDelegate.h"
#import "Lbirary/CZLog.h"
#import "Lbirary/CZUMTool.h"

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

#pragma mark - init

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [CZLog cz_configLog];
    
    // 友盟基础配置
    [CZUMTool cz_configWithAppkey:@"5911665ff5ade42612000644"];
    // 友盟分享
    [CZUMTool cz_configShareGlobal];
    [CZUMTool cz_configShareWechatAppkey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    [CZUMTool cz_configShareQQAppkey:@"1105821097" redirectURL:@"http://mobile.umeng.com/social"];
    // 友盟 push
    [self initWithUMPushWithLaunchOptions:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    CZLogDebug(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    CZLogDebug(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    CZLogDebug(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    CZLogDebug(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    CZLogDebug(@"applicationWillTerminate");
}

#pragma mark - openUrl

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    CZLogDebug(@"被其他 APP 打开 = %@", url);
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
        CZLogDebug(@"被其他 APP 打开");
    }
    return result;
}

#pragma mark - Push

- (void)initWithUMPushWithLaunchOptions:(NSDictionary *)launchOptions {
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    entity.types = UMessageAuthorizationOptionBadge | UMessageAuthorizationOptionSound | UMessageAuthorizationOptionAlert;
    if (@available(iOS 10.0, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    } else {
        CZLogDebug(@"iOS 10 以下的 推送？");
    }
    
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity     completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            CZLogDebug(@"push 打开");
        }else{
            CZLogDebug(@"push 关闭");
        }
    }];
}

//iOS10以下使用这两个方法接收通知
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion] intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
        CZLogInfo(@"iOS 10 以下，收到推送消息 = %@", userInfo);
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler  API_AVAILABLE(ios(10.0)){
    NSDictionary * userInfo = notification.request.content.userInfo;
    CZLogInfo(@"iOS 10 以上，收到前台推送消息 = %@", userInfo);
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        [UMessage didReceiveRemoteNotification:userInfo];
        //应用处于前台时的远程推送接受
        
    }else{
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(nonnull void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    CZLogInfo(@"iOS 10 以上，收到后台点击推送消息 = %@", userInfo);
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage didReceiveRemoteNotification:userInfo];
        //应用处于后台时的远程推送接受
        
    }else{
        //应用处于后台时的本地推送接受
    }
}


@end

