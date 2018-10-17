//
//  NSObject+cz.h
//  CZLibrary
//
//  Created by juyiwei on 2018/9/28.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define CZObjectIsEmpty(obj)    ([NSObject cz_objjectIsEmpty:obj])

@interface NSObject (cz)

/**
 判断对象为 nil 或者是 Null 对象

 @param obj obj
 @return BOOL
 */
+ (BOOL)cz_objjectIsEmpty:(id)obj;

@end

NS_ASSUME_NONNULL_END
