//
//  CZRootViewController.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZRootViewController.h"
#import "CZCoverViewController.h"
#import "CZTabBarController.h"

NSString *const czRootStoryboardMainName = @"Main";
NSString *const czRootStoryboardHomeName = @"Home";
NSString *const czRootStoryboardFindName = @"Find";
NSString *const czRootStoryboardMineName = @"Mine";

@interface CZRootViewController ()
@property (nonatomic, strong) CZCoverViewController *coverVC;
@property (nonatomic, strong) CZTabBarController *tabBarController;

@property (nonatomic, strong) UIViewController *currentVC;
@end

@implementation CZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.coverVC];
    [self addChildViewController:self.tabBarController];
    
    [self.view addSubview:self.coverVC.view];
    self.currentVC = self.coverVC;
    [self.coverVC didMoveToParentViewController:self];
}


#pragma mark - Methods

- (void)transformToViewController:(UIViewController *)vc {
    if (self.currentVC == vc) {
        return;
    }
    [self transitionFromViewController:self.currentVC toViewController:vc duration:0.75 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    } completion:^(BOOL finished) {
        self.currentVC = vc;
        [self.currentVC didMoveToParentViewController:self];
    }];
}

- (void)showLoginVC {
//    [self transformToViewController:self.loginVC];
}

- (void)showTabBarVC {
    [self transformToViewController:self.tabBarController];
}


#pragma mark - Status

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.currentVC;
}


#pragma mark - Getter

- (CZCoverViewController *)coverVC {
    if (!_coverVC) {
        _coverVC = [[UIStoryboard storyboardWithName:czRootStoryboardMainName bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CZCoverViewController class])];
    }
    return _coverVC;
}

- (CZTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[CZTabBarController alloc] init];
    }
    return _tabBarController;
}


@end



@implementation UIViewController (czRoot)

- (CZRootViewController *)cz_rootVC {
    UIViewController *tempVC = self;
    CZRootViewController *resVC;
    while (tempVC.parentViewController) {
        if ([tempVC.parentViewController isKindOfClass:[CZRootViewController class]]) {
            resVC = (CZRootViewController *)tempVC.parentViewController;
            break;
        }
        tempVC = tempVC.parentViewController;
    }
    return resVC;
}

@end
