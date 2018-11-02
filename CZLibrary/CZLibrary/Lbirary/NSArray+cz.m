//
//  NSArray+cz.m
//  CZLibrary
//
//  Created by juyiwei on 2018/10/25.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSArray+cz.h"
#import "NSDictionary+cz.h"

@implementation NSArray (cz)

#if DEBUG

- (NSString *)cz_formatterDescription {
    __block NSMutableString *jsonString = [NSMutableString string];
    [jsonString appendString:@"["];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *temp;
        if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            temp = [NSString stringWithFormat:@"%@,", obj];
        } else {
            temp = [NSString stringWithFormat:@"\"%@\",", obj];
        }
        [jsonString appendString:temp];
    }];
    
    [jsonString deleteCharactersInRange:NSMakeRange(jsonString.length-1, 1)];
    [jsonString appendString:@"]"];
    
    return jsonString;
}

- (NSString *)debugDescription {
    return [self cz_formatterDescription];
}

- (NSString *)descriptionWithLocale:(id)locale {
    return [self cz_formatterDescription];
}

- (NSString *)description {
    return [self cz_formatterDescription];
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return [self cz_formatterDescription];
}

- (NSString *)descriptionInStringsFileFormat {
    return [self cz_formatterDescription];
}

#endif

@end
