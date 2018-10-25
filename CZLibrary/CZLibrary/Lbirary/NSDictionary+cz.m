
//
//  NSDictionary+cz.m
//  CZLibrary
//
//  Created by juyiwei on 2018/10/25.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSDictionary+cz.h"

@implementation NSDictionary (cz)

- (NSString *)cz_formatterDescription {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (!error) {
        NSString *res = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSString *res2 = [res stringByReplacingOccurrencesOfString:@" " withString:@""];
        res2 = [res2 stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        return [NSString stringWithFormat:@"\n> JsonString\n\n%@ \n\n> For Read\n\n%@", res2, res];
    }
    
    return @"not json Data ?";
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



@end
