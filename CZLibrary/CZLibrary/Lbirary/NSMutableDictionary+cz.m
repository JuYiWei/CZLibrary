//
//  NSMutableDictionary+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/13.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSMutableDictionary+cz.h"
#import "CZLog.h"
#import "NSObject+cz.h"

@implementation NSMutableDictionary (cz)

- (void)cz_addUnEmptyObj:(id)obj forKey:(NSString *)key {
    if (CZObjectIsEmpty(obj)) {
        CZLogVerbose(@"对象不存在：%@", key);
        
    } else {
        [self setObject:obj forKey:key];
    }
}

- (void)cz_addUnEmptyString:(id)obj forKey:(NSString *)key {
    if ([obj isKindOfClass:[NSString class]]) {
        [self setObject:obj forKey:key];
        
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        NSString *string = [NSString stringWithFormat:@"%@", obj];
        [self setObject:string forKey:key];
        
    } else {
        CZLogVerbose(@"参数值不是 String 或者 Number：%@", key);
    }
}

@end
