//
//  NSDate+cz.h
//  CZLibrary
//
//  Created by juyiwei on 2019/1/4.
//  Copyright © 2019 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (cz)

/**
 间隔天数

 @param start 开始时间
 @return 返回天数，不算 2 头
 */
- (NSInteger)cz_dayPaddingFromStartDate:(NSDate *)start;

@end

NS_ASSUME_NONNULL_END
