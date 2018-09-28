//
//  UIColor+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "UIColor+cz.h"

@implementation UIColor (cz)

#pragma mark - 类方法

+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue {
    return [UIColor cz_hexValueColor:hexValue alpha:1.];
}

+ (UIColor *)cz_hexValueColor:(NSInteger)hexValue alpha:(CGFloat)alpha {
    CGFloat r = ((hexValue & 0xFF0000) >> 16)/255.0;
    CGFloat g = ((hexValue & 0xFF00) >> 8)/255.0;
    CGFloat b = (hexValue & 0xFF)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

+ (UIColor *)cz_hexColor:(NSString *)hexString {
    return [UIColor cz_hexColor:hexString alpha:1.];
}

+ (UIColor *)cz_hexColor:(NSString *)hexString alpha:(CGFloat)alpha {
    if (hexString.length != 6) {
        return [UIColor blackColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [hexString substringWithRange:range];
    range.location = 2;
    NSString *gString = [hexString substringWithRange:range];
    range.location = 4;
    NSString *bString = [hexString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)cz_gradientColoes:(NSArray <UIColor *>*)colors withSize:(CGSize)size direction:(CZGradientColorDirection)direction {
    if (colors.count < 2) {
        return [UIColor blackColor];
    }
    __block NSMutableArray *colorArray = [NSMutableArray array];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [colorArray addObject:(id)obj.CGColor];
    }];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colorArray, NULL);
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(size.width, size.height);
    
    switch (direction) {
        case CZGradientColorDirectionTop:{
            break;
        }
            
        case CZGradientColorDirectionLeft: {
            endPoint = CGPointMake(size.width, 0);
            break;
        }
            
        case CZGradientColorDirectionLeftTop: {
            endPoint = CGPointMake(0, size.height);
            break;
        }
            
        case CZGradientColorDirectionRightTop: {
            startPoint = CGPointMake(size.width, 0);
            endPoint = CGPointMake(0, size.height);
            break;
        }
    }
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

#pragma mark - 实例方法

- (UIColor *)cz_addAlpha:(CGFloat)alpha {
    CGFloat r,g,b,a;
    BOOL res = [self getRed:&r green:&g blue:&b alpha:&a];
    if (res) {
        return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    } else {
        return [UIColor blackColor];
    }
}

@end
