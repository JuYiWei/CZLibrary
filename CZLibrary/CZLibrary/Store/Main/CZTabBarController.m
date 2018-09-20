//
//  CZTabBarController.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZNavigationController.h"

NSString *const czStoryboardName0 = @"Home";
NSString *const czStoryboardName1 = @"Find";
NSString *const czStoryboardName2 = @"Mine";

NSString *const czTabBarTitle0 = @"首页";
NSString *const czTabBarTitle1 = @"发现";
NSString *const czTabBarTitle2 = @"我的";

NSString *const czTabBarImage00 = @"TabBarImage00";
NSString *const czTabBarImage10 = @"TabBarImage10";
NSString *const czTabBarImage20 = @"TabBarImage20";

NSString *const czTabBarImage01 = @"TabBarImage01";
NSString *const czTabBarImage11 = @"TabBarImage11";
NSString *const czTabBarImage21 = @"TabBarImage21";

NSString *const czTabBarSelectIndexKey = @"index";
NSString *const czTabBarSelectTitleKey = @"title";

NSString *const czTabBarSelectItemNotificationKey = @"com.cz.czTabBarSelectItemNotificationKey";

@interface CZTabBarController ()

@end

@implementation CZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *normalAttribute = @{NSForegroundColorAttributeName : [UIColor lightGrayColor]};
    NSDictionary *selectAttribute = @{NSForegroundColorAttributeName : [UIColor redColor]};
    
    ////////////////////////////// tabbar item \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    CZNavigationController *tabbarNav0 = [UIStoryboard storyboardWithName:czStoryboardName0 bundle:nil].instantiateInitialViewController;
    tabbarNav0.tabBarItem.title = czTabBarTitle0;
    tabbarNav0.tabBarItem.image = [UIImage imageNamed:czTabBarImage00];
    tabbarNav0.tabBarItem.selectedImage = [[UIImage imageNamed:czTabBarImage01] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabbarNav0.tabBarItem setTitleTextAttributes:selectAttribute forState:UIControlStateSelected];
    [tabbarNav0.tabBarItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    CZNavigationController *tabbarNav1 = [UIStoryboard storyboardWithName:czStoryboardName1 bundle:nil].instantiateInitialViewController;
    tabbarNav1.tabBarItem.title = czTabBarTitle1;
    tabbarNav1.tabBarItem.image = [UIImage imageNamed:czTabBarImage10];
    tabbarNav1.tabBarItem.selectedImage = [[UIImage imageNamed:czTabBarImage11] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabbarNav1.tabBarItem setTitleTextAttributes:selectAttribute forState:UIControlStateSelected];
    [tabbarNav1.tabBarItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    CZNavigationController *tabbarNav2 = [UIStoryboard storyboardWithName:czStoryboardName2 bundle:nil].instantiateInitialViewController;
    tabbarNav2.tabBarItem.title = czTabBarTitle2;
    tabbarNav2.tabBarItem.image = [UIImage imageNamed:czTabBarImage20];
    tabbarNav2.tabBarItem.selectedImage = [[UIImage imageNamed:czTabBarImage21] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabbarNav2.tabBarItem setTitleTextAttributes:selectAttribute forState:UIControlStateSelected];
    [tabbarNav2.tabBarItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    self.viewControllers = @[tabbarNav0, tabbarNav1, tabbarNav2];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if ([item.title isEqualToString:czTabBarTitle0]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:czTabBarSelectItemNotificationKey object:nil userInfo:@{czTabBarSelectIndexKey:@0, czTabBarSelectTitleKey:item.title}];
    } else if ([item.title isEqualToString:czTabBarTitle1]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:czTabBarSelectItemNotificationKey object:nil userInfo:@{czTabBarSelectIndexKey:@1, czTabBarSelectTitleKey:item.title}];
    } else if ([item.title isEqualToString:czTabBarTitle2]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:czTabBarSelectItemNotificationKey object:nil userInfo:@{czTabBarSelectIndexKey:@2, czTabBarSelectTitleKey:item.title}];
    }
}


#pragma mark - Status

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.childViewControllers[self.selectedIndex];
}


@end

