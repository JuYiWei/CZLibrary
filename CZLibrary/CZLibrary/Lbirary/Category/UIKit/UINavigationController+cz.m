//
//  UINavigationController+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "UINavigationController+cz.h"

@implementation UINavigationController (cz)

- (void)cz_changeNavAlpha:(CGFloat)alpha {
    NSArray *navBarSubViews = self.navigationBar.subviews;
    [navBarSubViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[NSString stringWithFormat:@"%@", obj.class] isEqualToString: @"_UIBarBackground"]) {
            NSArray *subViews = obj.subviews;
            [subViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UIVisualEffectView class]]) {
                    obj.alpha = alpha;
                    *stop = YES;
                }
            }];
        }
    }];
}

- (void)cz_changeNavTitleAlpha:(CGFloat)alpha {
    NSArray *navBarSubViews = self.navigationBar.subviews;
    [navBarSubViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[NSString stringWithFormat:@"%@", obj.class] isEqualToString: @"_UINavigationBarContentView"]) {
            NSArray *subViews = obj.subviews;
            [subViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UILabel class]]) {
                    obj.alpha = alpha;
                    *stop = YES;
                }
            }];
        }
    }];
}

- (void)cz_changeNavLargeTitleAlpha:(CGFloat)alpha {
    NSArray *navBarSubViews = self.navigationBar.subviews;
    [navBarSubViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[NSString stringWithFormat:@"%@", obj.class] isEqualToString: @"_UINavigationBarLargeTitleView"]) {
            NSArray *subViews = obj.subviews;
            [subViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UILabel class]]) {
                    obj.alpha = alpha;
                    *stop = YES;
                }
            }];
        }
    }];
}

- (void)cz_changeNavBottomLineHidden:(BOOL)hidden {
    NSArray *navBarSubViews = self.navigationBar.subviews;
    [navBarSubViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[NSString stringWithFormat:@"%@", obj.class] isEqualToString: @"_UIBarBackground"]) {
            NSArray *subViews = obj.subviews;
            [subViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UIImageView class]]) {
                    obj.hidden = hidden;
                    *stop = YES;
                }
            }];
        }
    }];
}

@end
