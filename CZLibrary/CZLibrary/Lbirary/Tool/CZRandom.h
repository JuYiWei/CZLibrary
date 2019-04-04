//
//  CZRandom.h
//  Library
//
//  Created by juyiwei on 2018/9/11.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZRandom : NSObject

/**
 随机颜色

 @return color
 */
+ (UIColor *)cz_randomColor;

/**
 UUID 身份 id

 @return string
 */
+ (NSString *)cz_identifier;

/**
 随机整数 [0, max)

 @param max max
 @return integer
 */
+ (NSInteger)cz_randomValue:(NSInteger)max;

/**
 随机字符串 [0, 30)

 @return string
 */
+ (NSString *)cz_randomString;

/**
 随机 字符串 [0, n)

 @param len len
 @return string
 */
+ (NSString *)cz_randomStringWithLength:(NSInteger)len;

/**
 随机 数字字母 字符串 [0,n)

 @param len len
 @return string
 */
+ (NSString *)cz_randomEnglishStringWithLength:(NSInteger)len;

/**
 随机 中文 字符串 [0, n)

 @param len len
 @return string
 */
+ (NSString *)cz_randomChineseStringWithLength:(NSInteger)len;

@end
