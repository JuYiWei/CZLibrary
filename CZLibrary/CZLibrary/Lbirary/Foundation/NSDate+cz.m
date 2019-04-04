//
//  NSDate+cz.m
//  CZLibrary
//
//  Created by juyiwei on 2019/1/4.
//  Copyright © 2019 居祎炜. All rights reserved.
//

#import "NSDate+cz.h"

@implementation NSDate (cz)

- (NSInteger)cz_dayPaddingFromStartDate:(NSDate *)start {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:start toDate:self options:0];
    
    return components.day;
}

@end
