//
//  UINavigationController+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (cz)

/**
 修改背景透明度

 @param alpha alpha
 */
- (void)cz_changeNavAlpha:(CGFloat)alpha;

/**
 修改标题透明度

 @param alpha alpha
 */
- (void)cz_changeNavTitleAlpha:(CGFloat)alpha;

/**
 修改大标题透明度

 @param alpha alpha
 */
- (void)cz_changeNavLargeTitleAlpha:(CGFloat)alpha;

/**
 是否隐藏底部的横线

 @param hidden hidden
 */
- (void)cz_changeNavBottomLineHidden:(BOOL)hidden;

@end
