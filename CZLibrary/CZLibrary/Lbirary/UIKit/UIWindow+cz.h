//
//  UIWindow+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/13.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (cz)

/**
 获取顶层的 window
 
 @return window
 */
+ (UIWindow *)cz_frontWindow;

@end
