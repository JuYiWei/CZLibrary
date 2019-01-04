//
//  CZHUD.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "SVProgressHUD.h"
#import "MBProgressHUD.h"
#import "CZLibraryMacro.h"

@interface CZHUD : SVProgressHUD

#pragma mark - SVP HUD 使用原 类方法展示

/**
 SVPHUD 通用配置
 */
+ (void)cz_svpConfig;

#pragma mark - MBP HUD 使用单例方式展示

CZ_SINGLETON_HEADER(CZHUD)

/**
 纯文本提示

 @param message message description
 @param view view description
 */
- (void)cz_showMessage:(NSString *)message inView:(UIView *)view;

/**
 纯文本提示 默认顶层 window

 @param message message description
 */
- (void)cz_showMessage:(NSString *)message;

/**
 提示信息 + 文本

 @param message message description
 @param view view description
 */
- (void)cz_showInfoMessage:(NSString *)message inView:(UIView *)view;


/**
 提示信息 + 文本 默认顶层 window

 @param message message description
 */
- (void)cz_showInfoMessage:(NSString *)message;

/**
 加载动画

 @param view view description
 */
- (void)cz_showLoadingImageInView:(UIView *)view;

/**
 加载动画 默认顶层 window
 */
- (void)cz_showLoadingImage;

/**
 延迟 隐藏

 @param delay delay description
 */
- (void)cz_hideAfter:(NSTimeInterval)delay;

/**
 隐藏
 */
- (void)cz_hide;

@end








