//
//  NSObject+cz.m
//  CZLibrary
//
//  Created by juyiwei on 2018/9/28.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSObject+cz.h"

@implementation NSObject (cz)

+ (BOOL)cz_objjectIsEmpty:(id)obj {
    return (!obj || [obj isKindOfClass:[NSNull class]]);
}

@end
