//
//  CZLibraryMacro.h
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#ifndef CZLibraryMacro_h
#define CZLibraryMacro_h

#define CZLibraryErrorDomain @"CZLibraryErrorDomain"

// 通用基础类型 字符串
#define CZStringInteger(a)  [NSString stringWithFormat:@"%@", @(a)]
#define CZStringFloat(a)    [NSString stringWithFormat:@"%.f", a]
#define CZStringFloat1(a)    [NSString stringWithFormat:@"%.1f", a]
#define CZStringFloat2(a)   [NSString stringWithFormat:@"%.2f", a]
#define CZStringFloat3(a)   [NSString stringWithFormat:@"%.3f", a]
#define CZStringNumber(a)   [NSString stringWithFormat:@"%@", a]


// 循环引用
#define CZWeakify(o)    autoreleasepool{} __weak typeof(o) o##Weak = o;
#define CZStrongify(o)  autoreleasepool{} __strong typeof(o) o = o##Weak;

// tag 基础值偏移
#define CZTagControllerLevel    100000
#define CZTagViewLevel          200000
#define CZTagOtherLevel         300000

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
