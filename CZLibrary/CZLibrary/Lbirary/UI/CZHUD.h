//
//  CZHUD.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "SVProgressHUD.h"
#import "MBProgressHUD.h"

@interface CZHUD : SVProgressHUD

/*! 使用 SVPHUD 的话，配置通用样式 */
+ (void)svp_config;




+ (instancetype)sharedInstance;

/*! 纯文本，指定 view */
- (void)showMessage:(NSString *)message inView:(UIView *)view;
/*! 提示信息 + 文本，指定 view */
- (void)showInfoMessage:(NSString *)message inView:(UIView *)view;
/*! 加载动画，指定 view */
- (void)showLoadingImageInView:(UIView *)view;

/*! 纯文本，默认顶层 window */
- (void)showMessage:(NSString *)message;
/*! 提示信息 + 文本，默认顶层 window */
- (void)showInfoMessage:(NSString *)message;
/*! 加载动画，默认顶层 window */
- (void)showLoadingImage;

/*! 延迟 隐藏 */
- (void)hideAfter:(NSTimeInterval)delay;
/*! 隐藏 */
- (void)hide;

@end








