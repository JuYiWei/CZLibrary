//
//  UIColor+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CZHexColor(hex) [UIColor cz_hexColor:hex]
#define CZHexColorA(hex, a) [UIColor cz_hexColor:hex alpha:a]

/*! 渐变起点位置 */
typedef NS_ENUM(NSInteger, CZGradientColorDirection) {
    /*! 从上到下 */
    CZGradientColorDirectionTop = 0,
    /*! 从左到右 */
    CZGradientColorDirectionLeft,
    /*! 从左上到右下 */
    CZGradientColorDirectionLeftTop,
    /*! 从右上到左下 */
    CZGradientColorDirectionRightTop
};

@interface UIColor (cz)

#pragma mark - 类方法

/**
 16进制值 转颜色

 @param hexValue 16进制值
 @return color
 */
+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue;

/**
 16进制值 转颜色
 
 @param hexValue 16进制值
 @param alpha 透明度
 @return color
 */
+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 16进制字符串 转颜色
 
 @param hexString 16进制字符串
 @return color
 */
+ (UIColor *)cz_hexColor:(NSString *)hexString;

/**
 16进制字符串 转颜色
 
 @param hexString 16进制字符串
 @return color
 */
+ (UIColor *)cz_hexColor:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 线性渐变，均匀变化

 @param colors 颜色数组
 @param size 大小
 @param direction 方向
 @return color
 */
+ (UIColor *)cz_gradientColoes:(NSArray <UIColor *>*)colors withSize:(CGSize)size direction:(CZGradientColorDirection)direction;

#pragma mark - 实例方法

/*! 已有颜色 添加透明度 */
- (UIColor *)cz_addAlpha:(CGFloat)alpha;

@end
