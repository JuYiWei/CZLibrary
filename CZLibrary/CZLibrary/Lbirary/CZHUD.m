//
//  CZHUD.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZHUD.h"
#import "UIColor+cz.h"
#import "UIView+cz.h"
#import "UIWindow+cz.h"
#import "NSString+cz.h"

CGFloat const CZHUD_HEIGHT = 76;
CGFloat const CZHUD_PADDING = 16;

@interface CZHUD()
@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *messageLabel;
@end

@implementation CZHUD

#pragma mark - SVP HUD

+ (void)cz_svpConfig {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:10.];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 120)];
    
    // 提示文本
    [SVProgressHUD setFont:[UIFont systemFontOfSize:16.]];
    
    // 圆环、进度条
    [SVProgressHUD setRingThickness:2];
    [SVProgressHUD setRingRadius:30];
    [SVProgressHUD setRingNoTextRadius:30];
    
    // 背景
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setBackgroundLayerColor:[UIColor colorWithWhite:0. alpha:0.2]];
    
    // 展示时间
    [SVProgressHUD setMinimumDismissTimeInterval:2.];
    
    // 自定义图片
    //    [SVProgressHUD setImageViewSize:CGSizeMake(30., 30.)];
    //    [SVProgressHUD setShouldTintImages:NO];
    //    [SVProgressHUD setSuccessImage:[UIImage imageNamed:@"hud_icon_success"]];
    //    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"hud_icon_failure"]];
    //    [SVProgressHUD setInfoImage:[[UIImage imageNamed:@"hud_icon_info"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}


#pragma mark - MBP HUD

CZ_SINGLETON_IMPLEMENTATION(CZHUD)

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

/*! 自定义 通用处理 */
- (void)showCustomImageView:(UIImageView *)imageView inView:(UIView *)view {
    self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.customView = imageView;
    self.hud.bezelView.color = [UIColor clearColor];
    self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.backgroundView.backgroundColor = [UIColor cz_hexColor:@"000000" alpha:0.2];
}


- (void)cz_showMessage:(NSString *)message {
    [self cz_showMessage:message inView:[UIWindow cz_frontWindow]];
}

- (void)cz_showMessage:(NSString *)message inView:(UIView *)view {
    UIFont *messageFont = [UIFont systemFontOfSize:16];
    CGFloat messageWidth = [message cz_rectWithFont:messageFont].size.width;
    
    self.iconImageView.hidden = YES;
    self.customView.frame = CGRectMake(0, 0, CZHUD_PADDING + messageWidth + CZHUD_PADDING, CZHUD_HEIGHT);
    self.messageLabel.frame = CGRectMake(CZHUD_PADDING, 0, messageWidth, CZHUD_HEIGHT);
    self.messageLabel.font = messageFont;
    self.messageLabel.text = message;
    
    UIImage *image = [self.customView cz_viewCapture];
    [self showCustomImageView:[[UIImageView alloc] initWithImage:image] inView:view];
    [self.hud hideAnimated:YES afterDelay:2];
}

- (void)cz_showInfoMessage:(NSString *)message {
    [self cz_showInfoMessage:message inView:[UIWindow cz_frontWindow]];
}

- (void)cz_showInfoMessage:(NSString *)message inView:(UIView *)view {
    UIFont *messageFont = [UIFont systemFontOfSize:16];
    CGFloat messageWidth = [message cz_rectWithFont:messageFont].size.width;
    UIImage *iconImage = [UIImage imageNamed:@"hud_loading_01"];
    CGFloat iconImageWidth = iconImage.size.width;
    CGFloat iconImageHeight = iconImage.size.height;
    
    self.customView.frame = CGRectMake(0, 0, CZHUD_PADDING + iconImageWidth + CZHUD_PADDING + messageWidth + CZHUD_PADDING, CZHUD_HEIGHT);
    
    self.iconImageView.hidden = NO;
    self.iconImageView.image = iconImage;
    self.iconImageView.frame = CGRectMake(CZHUD_PADDING, (CZHUD_HEIGHT - iconImageHeight) / 2, iconImageWidth, iconImageHeight);
    
    self.messageLabel.frame = CGRectMake(CZHUD_PADDING + iconImageWidth + CZHUD_PADDING, 0, messageWidth, CZHUD_HEIGHT);
    self.messageLabel.font = messageFont;
    self.messageLabel.text = message;
    
    UIImage *image = [self.customView cz_viewCapture];
    [self showCustomImageView:[[UIImageView alloc] initWithImage:image] inView:view];
    [self.hud hideAnimated:YES afterDelay:2];
}

- (void)cz_showLoadingImage {
    [self cz_showLoadingImageInView:[UIWindow cz_frontWindow]];
}

- (void)cz_showLoadingImageInView:(UIView *)view {
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_loading_01"]];
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"hud_loading_%02d", i]];
        [imageArray addObject:image];
    }
    [gifImageView setAnimationImages:imageArray];
    [gifImageView setAnimationDuration:.2 * imageArray.count];
    [gifImageView setAnimationRepeatCount:0];
    [gifImageView startAnimating];

    [self showCustomImageView:gifImageView inView:view];
}

- (void)cz_hideAfter:(NSTimeInterval)delay {
    [self.hud hideAnimated:YES afterDelay:delay];
}

- (void)cz_hide {
    [self.hud hideAnimated:YES];
}

#pragma mark - Getter

- (UIView *)customView {
    if (!_customView) {
        _customView = [UIView new];
        _customView.backgroundColor = [UIColor cz_hexColor:@"3f3f3f" alpha:0.8];
        _customView.layer.cornerRadius = 6.;
        [_customView addSubview:self.iconImageView];
        [_customView addSubview:self.messageLabel];
    }
    return _customView;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

@end
