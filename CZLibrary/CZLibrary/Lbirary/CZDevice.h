//
//  CZDevice.h
//  CZLibrary
//
//  Created by juyiwei on 2018/12/24.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 屏幕宽高
#define CZScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define CZScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define CZScreenScale   ([UIScreen mainScreen].scale)

// 屏幕区分 iPhone
#define CZScreenPhone_Max_1242x2688     ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1242, 2688)) : NO)
#define CZScreenPhone_X_1242x2208       ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1242, 2208)) : NO)
#define CZScreenPhone_Plus_1125x2436    ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125, 2436)) : NO)
#define CZScreenPhone_Xr_828x1792       ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(828, 1792)) : NO)
#define CZScreenPhone_6_750x1334        ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(750, 1334)) : NO)
#define CZScreenPhone_5_640x1136        ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(640, 1136)) : NO)
#define CZScreenPhone_4_640x960         ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(640, 960)) : NO)

// 屏幕区分 iPad
#define CZScreenPad_12_9_2048x2732      ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(2048, 2732)) : NO)
#define CZScreenPad_10_5_1668x2224      ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1668, 2224)) : NO)
#define CZScreenPad_9_7_1536x2048       ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1536, 2048)) : NO)


@interface CZDevice : NSObject

/**
 手机具体型号 例如 iPhone 8,2

 @return return value description
 */
+ (NSString *)cz_deviceModel;


@end

NS_ASSUME_NONNULL_END
