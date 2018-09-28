//
//  CZRandom.m
//  Library
//
//  Created by juyiwei on 2018/9/11.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZRandom.h"

@implementation CZRandom

+ (UIColor *)cz_randomColor {
    CGFloat r = (CGFloat)arc4random()/UINT_MAX;
    CGFloat g = (CGFloat)arc4random()/UINT_MAX;
    CGFloat b = (CGFloat)arc4random()/UINT_MAX;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

+ (NSString *)cz_identifier {
    return [NSUUID UUID].UUIDString;
}

+ (NSInteger)cz_randomValue:(NSInteger)max {
    return arc4random() % max;
}

+ (NSString *)cz_randomString {
    NSInteger len = arc4random() % 30;
    return [CZRandom cz_randomStringWithLength:len];
}

+ (NSString *)cz_randomStringWithLength:(NSInteger)len {
    NSMutableString *muString = [NSMutableString string];
    for (NSInteger a=0; a<len; a++) {
        NSInteger ran = arc4random() % 10;
        if (ran >7) {
            [muString appendString:[CZRandom cz_randomEnglishStringWithLength:1]];
        } else {
            [muString appendString:[CZRandom cz_randomChineseStringWithLength:1]];
        }
    }
    return muString;
}

+ (NSString *)cz_randomEnglishStringWithLength:(NSInteger)len {
    NSString *string = @"0123456789qwertyuiopasdfghjklzxcvbnm[];',./{}:<>?_+-=)(*&^%$#@!";
    NSMutableString *muString = [NSMutableString string];
    for (NSInteger a=0; a<len; a++) {
        NSInteger loc = arc4random() % string.length;
        [muString appendString:[string substringWithRange:NSMakeRange(loc, 1)]];
    }
    
    return muString;
}

+ (NSString *)cz_randomChineseStringWithLength:(NSInteger)len {
    NSMutableString *muString = [NSMutableString string];
    for (NSInteger a=0; a<len; a++) {
        [muString appendString:[CZRandom cz_randomSingelStringCH]];
    }
    return muString;
}

+ (NSString *)cz_randomSingelStringCH {
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
    NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
    NSInteger number = (randomH<<8)+randomL;
    NSData *data = [NSData dataWithBytes:&number length:2];
    NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    
    return string;
}

@end
