//
//  CZNavigationController.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZNavigationController.h"
#import "CZLibrary.h"

@interface CZNavigationController ()<UINavigationControllerDelegate>

@end

@implementation CZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                                 NSForegroundColorAttributeName:[UIColor cz_hexValueColor:123456]};
    [self.navigationBar setTitleTextAttributes:attributes];
    self.navigationBar.tintColor = [UIColor cz_hexValueColor:445678];
    self.navigationBar.barTintColor = [UIColor cz_hexValueColor:763651];
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.translucent = YES;
    
    // 默认透明，展示真实导航色，又存在 translucent 的特性
    [self cz_changeNavAlpha:0];
    [self cz_changeNavBottomLineHidden:YES];
    
    // 设置返回图片
    //    [self.navigationBar setBackIndicatorImage:[UIImage imageNamed:qkNavgationBackImage]];
    //    [self.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:qkNavgationBackImage]];
}


#pragma mark - UIStatusBarStyle

// 继承状态栏控制
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}


#pragma mark - UINavigationControllerDelegate

// 修改返回文字
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]
                                          initWithTitle:@"返回"
                                          style:UIBarButtonItemStylePlain
                                          target:nil
                                          action:nil];
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
}


#pragma mark - 重写 push 隐藏 TabBar

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;// 隐藏 Tabbar 按需
    [super pushViewController:viewController animated:animated];
}

@end
