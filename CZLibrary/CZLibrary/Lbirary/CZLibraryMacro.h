//
//  CZLibraryMacro.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#ifndef CZLibraryMacro_h
#define CZLibraryMacro_h


// 循环引用
#define CZWeakify(o)    autoreleasepool{} __weak typeof(o) o##Weak = o;
#define CZStrongify(o)  autoreleasepool{} __strong typeof(o) o = o##Weak;


// 屏幕宽高
#define CZScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define CZScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define CZScreenScale   ([UIScreen mainScreen].scale)


// 屏幕区分 iPhone
#define CZScreenPhone_Max_1242x2688  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1242, 2688)) : NO)

#define CZScreenPhone_X_1242x2208  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1242, 2208)) : NO)

#define CZScreenPhone_Plus_1125x2436  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125, 2436)) : NO)

#define CZScreenPhone_Xr_828x1792  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(828, 1792)) : NO)

#define CZScreenPhone_6_750x1334  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(750, 1334)) : NO)

#define CZScreenPhone_5_640x1136  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(640, 1136)) : NO)

#define CZScreenPhone_4_640x960  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(640, 960)) : NO)


// 屏幕区分 iPad
#define CZScreenPad_12_9_2048x2732  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(2048, 2732)) : NO)

#define CZScreenPad_10_5_1668x2224  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1668, 2224)) : NO)

#define CZScreenPad_9_7_1536x2048  ([[UIScreen mainScreen] respondsToSelector:@selector(currentMode)] ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1536, 2048)) : NO)



// tag 基础值偏移
#define CZTagControllerLevel 100000
#define CZTagViewLevel 200000
#define CZTagOtherLevel 300000


// 单例头宏(ARC .h)
#define CZ_SINGLETON_HEADER(className)                      \
+ (instancetype)sharedInstance;                             \

// 单例实现宏(ARC .m)
#define CZ_SINGLETON_IMPLEMENTATION(className)              \
static className *singleton;                               \
+ (instancetype)sharedInstance {                            \
    static dispatch_once_t onceToken;                       \
    dispatch_once(&onceToken, ^{                            \
        singleton = [[className alloc] init];              \
    });                                                     \
    return singleton;                                       \
}                                                           \




#endif /* CZLibraryMacro_h */
