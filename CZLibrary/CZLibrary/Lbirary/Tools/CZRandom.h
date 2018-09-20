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

/*! 随机颜色 */
+ (UIColor *)cz_randomColor;



/*! UUID 身份 id */
+ (NSString *)cz_identifier;



/*! 随机整数 [0, n) */
+ (NSInteger)cz_randomValue:(NSInteger)max;



/*! 随机字符串 [0, 30) */
+ (NSString *)cz_randomString;
/*! 随机字符串 [0, n) */
+ (NSString *)cz_randomStringWithLength:(NSInteger)len;
/*! 随机字符串，数字字母符号 [0, n) */
+ (NSString *)cz_randomEnglishStringWithLength:(NSInteger)len;
/*! 随机字符串，中文 [0, n) */
+ (NSString *)cz_randomChineseStringWithLength:(NSInteger)len;



@end
