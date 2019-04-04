
//
//  NSDictionary+cz.m
//  CZLibrary
//
//  Created by juyiwei on 2018/10/25.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSDictionary+cz.h"
#import "NSArray+cz.h"

@implementation NSDictionary (cz)

#if DEBUG

- (NSString *)cz_formatterDescription {
    __block NSMutableString *jsonString = [NSMutableString string];
    [jsonString appendString:@"{"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *temp;
        if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
            temp = [NSString stringWithFormat:@"\"%@\":%@,", key, obj];
        } else {
            temp = [NSString stringWithFormat:@"\"%@\":\"%@\",", key, obj];
        }
        [jsonString appendString:temp];
    }];
    [jsonString deleteCharactersInRange:NSMakeRange(jsonString.length-1, 1)];
    [jsonString appendString:@"}"];
    
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
