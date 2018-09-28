//
//  CZAdaptTool.h
//  Library
//
//  Created by juyiwei on 2018/7/2.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZLibraryMacro.h"

// 设备类型
typedef NS_ENUM(NSUInteger, CZAdaptDeviceType) {
    CZAdaptTypePhone,
    CZAdaptTypePad,
    CZAdaptTypeUndefine
};

// 尺寸类型
typedef NS_ENUM(NSUInteger, CZAdaptSizeClassType) {
    CZAdaptSizeClassCR, // iphone 长条状，包括 iPad 分屏
    CZAdaptSizeClassRR, // iPad 块状，包括 iPad 分屏
    
    CZAdaptSizeClassCC, // iphone 横屏
    CZAdaptSizeClassRC, // plus 横屏
    CZAdaptSizeClassUndefine
};

@interface CZAdaptTool : NSObject

CZ_SINGLETON_HEADER(CZAdaptTool)

/**
 设备类型

 @param view 需要检测的 view
 @return 真实的设备类型，iPhone 和 iPad
 */
- (CZAdaptDeviceType)cz_deviceTypeWithView:(UIView *)view;

/**
 尺寸类型

 @param view 需要检测的 view
 @return 推荐使用，支持 iPad 分屏，用 CR 和 RR 区分 iPhone 和 iPad 型
 */
- (CZAdaptSizeClassType)cz_sizeClassTypeWithView:(UIView *)view;

@end
