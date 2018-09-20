//
//  UIColor+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CZColor(hex) [UIColor cz_hexColor:hex]

/*! 渐变起点位置 */
typedef NS_ENUM(NSInteger, CZGradientColorDirection) {
    CZGradientColorDirectionTop = 0,
    CZGradientColorDirectionLeft,
    CZGradientColorDirectionLeftTop,
    CZGradientColorDirectionRightTop
};

@interface UIColor (cz)


#pragma mark - 类方法

/*! 16进制值 */
+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue;
/*! 16进制值 */
+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue alpha:(CGFloat)alpha;

/*! 16进制字符串 */
+ (UIColor *)cz_hexColor:(NSString *)hexString;
/*! 16进制字符串 */
+ (UIColor *)cz_hexColor:(NSString *)hexString alpha:(CGFloat)alpha;

/*! 渐变色 */
+ (UIColor *)cz_gradientColoes:(NSArray <UIColor *>*)colors withSize:(CGSize)size direction:(CZGradientColorDirection)direction;


#pragma mark - 实例方法

/*! 已有颜色 添加透明度 */
- (UIColor *)cz_addAlpha:(CGFloat)alpha;

@end
