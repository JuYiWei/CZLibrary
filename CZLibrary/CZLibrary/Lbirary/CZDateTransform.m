//
//  CZDateTool.m
//  Library
//
//  Created by juyiwei on 2018/9/6.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZDateTransform.h"

@interface CZDateTransform()
@property (nonatomic, strong) NSDateFormatter *formatter_transverse_yyyy_MM_dd_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_transverse_yyyy_MM_dd_HH_mm;
@property (nonatomic, strong) NSDateFormatter *formatter_transverse_yyyy_MM_dd;
@property (nonatomic, strong) NSDateFormatter *formatter_transverse_yyyy_MM;

@property (nonatomic, strong) NSDateFormatter *formatter_point_yyyy_MM_dd_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_point_yyyy_MM_dd_HH_mm;
@property (nonatomic, strong) NSDateFormatter *formatter_point_yyyy_MM_dd;
@property (nonatomic, strong) NSDateFormatter *formatter_point_yyyy_MM;

@property (nonatomic, strong) NSDateFormatter *formatter_slash_yyyy_MM_dd_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_slash_yyyy_MM_dd_HH_mm;
@property (nonatomic, strong) NSDateFormatter *formatter_slash_yyyy_MM_dd;
@property (nonatomic, strong) NSDateFormatter *formatter_slash_yyyy_MM;

@property (nonatomic, strong) NSDateFormatter *formatter_chinese_yyyy_MM_dd_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_chinese_yyyy_MM_dd_HH_mm;
@property (nonatomic, strong) NSDateFormatter *formatter_chinese_yyyy_MM_dd;
@property (nonatomic, strong) NSDateFormatter *formatter_chinese_yyyy_MM;

@property (nonatomic, strong) NSDateFormatter *formatter_normal_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_normal_HH_mm;

@property (nonatomic, strong) NSDateFormatter *formatter_chinese_HH_mm_ss;
@property (nonatomic, strong) NSDateFormatter *formatter_chinese_HH_mm;
@end

@implementation CZDateTransform

CZ_SINGLETON_IMPLEMENTATION(CZDateTransform)

#pragma mark - General transform

- (NSString *)cz_stringFromTimestamp:(NSTimeInterval)timestamp type:(CZDateToolType)type {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return [self cz_stringFromDate:date type:type];
}

- (NSString *)cz_stringFromDate:(NSDate *)date type:(CZDateToolType)type {
    return [[self selectDateFormatterWithType:type] stringFromDate:date];
}

- (NSDate *)cz_dateFromString:(NSString *)string type:(CZDateToolType)type {
    return [[self selectDateFormatterWithType:type] dateFromString:string];
}

- (NSTimeInterval)cz_timestampFromString:(NSString *)string type:(CZDateToolType)type {
    NSDate *date = [[self selectDateFormatterWithType:type] dateFromString:string];
    return [date timeIntervalSince1970];
}

#pragma mark - Priviate

- (NSDateFormatter *)selectDateFormatterWithType:(CZDateToolType)type {
    NSDateFormatter *formatter;
    switch (type) {
        case CZDateToolType_Transverse_yyyy_MM_dd_HH_mm_ss: {
            formatter = self.formatter_transverse_yyyy_MM_dd_HH_mm_ss;
            break;
        }
            
        case CZDateToolType_Transverse_yyyy_MM_dd_HH_mm: {
            formatter = self.formatter_transverse_yyyy_MM_dd_HH_mm;
            break;
        }
            
        case CZDateToolType_Transverse_yyyy_MM_dd: {
            formatter = self.formatter_transverse_yyyy_MM_dd;
            break;
        }
            
        case CZDateToolType_Transverse_yyyy_MM: {
            formatter = self.formatter_transverse_yyyy_MM;
            break;
        }
            
        case CZDateToolType_Point_yyyy_MM_dd_HH_mm_ss: {
            formatter = self.formatter_point_yyyy_MM_dd_HH_mm_ss;
            break;
        }
        case CZDateToolType_Point_yyyy_MM_dd_HH_mm: {
            formatter = self.formatter_point_yyyy_MM_dd_HH_mm;
            break;
        }
            
        case CZDateToolType_Point_yyyy_MM_dd:{
            formatter = self.formatter_point_yyyy_MM_dd;
            break;
        }
            
        case CZDateToolType_Point_yyyy_MM:{
            formatter = self.formatter_point_yyyy_MM;
            break;
        }
            
        case CZDateToolType_Slash_yyyy_MM_dd_HH_mm_ss: {
            formatter = self.formatter_slash_yyyy_MM_dd_HH_mm_ss;
            break;
        }
            
        case CZDateToolType_Slash_yyyy_MM_dd_HH_mm: {
            formatter = self.formatter_slash_yyyy_MM_dd_HH_mm;
            break;
        }
            
        case CZDateToolType_Slash_yyyy_MM_dd: {
            formatter = self.formatter_slash_yyyy_MM_dd;
            break;
        }
            
        case CZDateToolType_Slash_yyyy_MM: {
            formatter = self.formatter_slash_yyyy_MM;
            break;
        }
            
        case CZDateToolType_Chinese_yyyy_MM_dd_HH_mm_ss: {
            formatter = self.formatter_chinese_yyyy_MM_dd_HH_mm_ss;
            break;
        }
            
        case CZDateToolType_Chinese_yyyy_MM_dd_HH_mm: {
            formatter = self.formatter_chinese_yyyy_MM_dd_HH_mm;
            break;
        }
            
        case CZDateToolType_Chinese_yyyy_MM_dd: {
            formatter = self.formatter_chinese_yyyy_MM_dd;
            break;
        }
            
        case CZDateToolType_Chinese_yyyy_MM: {
            formatter = self.formatter_chinese_yyyy_MM;
            break;
        }
            
        case CZDateToolType_Normal_HH_mm_ss: {
            formatter = self.formatter_normal_HH_mm_ss;
            break;
        }
            
        case CZDateToolType_Normal_HH_mm: {
            formatter = self.formatter_normal_HH_mm;
            break;
        }
            
        case CZDateToolType_Chinese_HH_mm_ss: {
            formatter = self.formatter_chinese_HH_mm_ss;
            break;
        }
            
        case CZDateToolType_Chinese_HH_mm: {
            formatter = self.formatter_chinese_HH_mm;
            break;
        }
            
        default:
            formatter = self.formatter_transverse_yyyy_MM_dd_HH_mm_ss;
            break;
    }
    
    return formatter;
}

#pragma mark - Getter Formatter

#pragma mark - 2018-09-09 09:09:09

- (NSDateFormatter *)formatter_transverse_yyyy_MM_dd_HH_mm_ss {
    if (!_formatter_transverse_yyyy_MM_dd_HH_mm_ss) {
        _formatter_transverse_yyyy_MM_dd_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_transverse_yyyy_MM_dd_HH_mm_ss setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return _formatter_transverse_yyyy_MM_dd_HH_mm_ss;
}

- (NSDateFormatter *)formatter_transverse_yyyy_MM_dd_HH_mm {
    if (!_formatter_transverse_yyyy_MM_dd_HH_mm) {
        _formatter_transverse_yyyy_MM_dd_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_transverse_yyyy_MM_dd_HH_mm setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    return _formatter_transverse_yyyy_MM_dd_HH_mm;
}

- (NSDateFormatter *)formatter_transverse_yyyy_MM_dd {
    if (!_formatter_transverse_yyyy_MM_dd) {
        _formatter_transverse_yyyy_MM_dd = [[NSDateFormatter alloc] init];
        [_formatter_transverse_yyyy_MM_dd setDateFormat:@"yyyy-MM-dd"];
    }
    return _formatter_transverse_yyyy_MM_dd;
}

- (NSDateFormatter *)formatter_transverse_yyyy_MM {
    if (!_formatter_transverse_yyyy_MM) {
        _formatter_transverse_yyyy_MM = [[NSDateFormatter alloc] init];
        [_formatter_transverse_yyyy_MM setDateFormat:@"yyyy-MM"];
    }
    return _formatter_transverse_yyyy_MM;
}

#pragma mark - 2018.09.09 09:09:09

- (NSDateFormatter *)formatter_point_yyyy_MM_dd_HH_mm_ss {
    if (!_formatter_point_yyyy_MM_dd_HH_mm_ss) {
        _formatter_point_yyyy_MM_dd_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_point_yyyy_MM_dd_HH_mm_ss setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    }
    return _formatter_point_yyyy_MM_dd_HH_mm_ss;
}

- (NSDateFormatter *)formatter_point_yyyy_MM_dd_HH_mm {
    if (!_formatter_point_yyyy_MM_dd_HH_mm) {
        _formatter_point_yyyy_MM_dd_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_point_yyyy_MM_dd_HH_mm setDateFormat:@"yyyy.MM.dd HH:mm"];
    }
    return _formatter_point_yyyy_MM_dd_HH_mm;
}

- (NSDateFormatter *)formatter_point_yyyy_MM_dd {
    if (!_formatter_point_yyyy_MM_dd) {
        _formatter_point_yyyy_MM_dd = [[NSDateFormatter alloc] init];
        [_formatter_point_yyyy_MM_dd setDateFormat:@"yyyy.MM.dd"];
    }
    return _formatter_point_yyyy_MM_dd;
}

- (NSDateFormatter *)formatter_point_yyyy_MM {
    if (!_formatter_point_yyyy_MM) {
        _formatter_point_yyyy_MM = [[NSDateFormatter alloc] init];
        [_formatter_point_yyyy_MM setDateFormat:@"yyyy.MM"];
    }
    return _formatter_point_yyyy_MM;
}

#pragma mark - 2018/09/09 09/09/09

- (NSDateFormatter *)formatter_slash_yyyy_MM_dd_HH_mm_ss {
    if (!_formatter_slash_yyyy_MM_dd_HH_mm_ss) {
        _formatter_slash_yyyy_MM_dd_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_slash_yyyy_MM_dd_HH_mm_ss setDateFormat:@"yyyy/MM/dd HH/mm/ss"];
    }
    return _formatter_slash_yyyy_MM_dd_HH_mm_ss;
}

- (NSDateFormatter *)formatter_slash_yyyy_MM_dd_HH_mm {
    if (!_formatter_slash_yyyy_MM_dd_HH_mm) {
        _formatter_slash_yyyy_MM_dd_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_slash_yyyy_MM_dd_HH_mm setDateFormat:@"yyyy/MM/dd HH/mm"];
    }
    return _formatter_slash_yyyy_MM_dd_HH_mm;
}

- (NSDateFormatter *)formatter_slash_yyyy_MM_dd {
    if (!_formatter_slash_yyyy_MM_dd) {
        _formatter_slash_yyyy_MM_dd = [[NSDateFormatter alloc] init];
        [_formatter_slash_yyyy_MM_dd setDateFormat:@"yyyy/MM/dd"];
    }
    return _formatter_slash_yyyy_MM_dd;
}

- (NSDateFormatter *)formatter_slash_yyyy_MM {
    if (!_formatter_slash_yyyy_MM) {
        _formatter_slash_yyyy_MM = [[NSDateFormatter alloc] init];
        [_formatter_slash_yyyy_MM setDateFormat:@"yyyy/MM"];
    }
    return _formatter_slash_yyyy_MM;
}

#pragma mark - 2018年09月09日 09时09分09秒

- (NSDateFormatter *)formatter_chinese_yyyy_MM_dd_HH_mm_ss {
    if (!_formatter_chinese_yyyy_MM_dd_HH_mm_ss) {
        _formatter_chinese_yyyy_MM_dd_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_chinese_yyyy_MM_dd_HH_mm_ss setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    }
    return _formatter_chinese_yyyy_MM_dd_HH_mm_ss;
}

- (NSDateFormatter *)formatter_chinese_yyyy_MM_dd_HH_mm {
    if (!_formatter_chinese_yyyy_MM_dd_HH_mm) {
        _formatter_chinese_yyyy_MM_dd_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_chinese_yyyy_MM_dd_HH_mm setDateFormat:@"yyyy年MM月dd日 HH时mm分"];
    }
    return _formatter_chinese_yyyy_MM_dd_HH_mm;
}

- (NSDateFormatter *)formatter_chinese_yyyy_MM_dd {
    if (!_formatter_chinese_yyyy_MM_dd) {
        _formatter_chinese_yyyy_MM_dd = [[NSDateFormatter alloc] init];
        [_formatter_chinese_yyyy_MM_dd setDateFormat:@"yyyy年MM月dd日"];
    }
    return _formatter_chinese_yyyy_MM_dd;
}

- (NSDateFormatter *)formatter_chinese_yyyy_MM {
    if (!_formatter_chinese_yyyy_MM) {
        _formatter_chinese_yyyy_MM = [[NSDateFormatter alloc] init];
        [_formatter_chinese_yyyy_MM setDateFormat:@"yyyy年MM月"];
    }
    return _formatter_chinese_yyyy_MM;
}

#pragma mark - 时分秒

- (NSDateFormatter *)formatter_normal_HH_mm_ss {
    if (!_formatter_normal_HH_mm_ss) {
        _formatter_normal_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_normal_HH_mm_ss setDateFormat:@"HH:mm:ss"];
    }
    return _formatter_normal_HH_mm_ss;
}

- (NSDateFormatter *)formatter_normal_HH_mm {
    if (!_formatter_normal_HH_mm) {
        _formatter_normal_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_normal_HH_mm setDateFormat:@"HH:mm"];
    }
    return _formatter_normal_HH_mm;
}

- (NSDateFormatter *)formatter_chinese_HH_mm_ss {
    if (!_formatter_chinese_HH_mm_ss) {
        _formatter_chinese_HH_mm_ss = [[NSDateFormatter alloc] init];
        [_formatter_chinese_HH_mm_ss setDateFormat:@"HH时mm分ss秒"];
    }
    return _formatter_chinese_HH_mm_ss;
}

- (NSDateFormatter *)formatter_chinese_HH_mm {
    if (!_formatter_chinese_HH_mm) {
        _formatter_chinese_HH_mm = [[NSDateFormatter alloc] init];
        [_formatter_chinese_HH_mm setDateFormat:@"HH时mm分"];
    }
    return _formatter_chinese_HH_mm;
}

#pragma mark - 最近

- (void)cz_timestampRangeLastDays:(NSInteger)days block:(void(^)(NSTimeInterval start, NSTimeInterval end))block {
    NSDate *today = [NSDate date];
    NSString *todayString = [self.formatter_transverse_yyyy_MM_dd stringFromDate:today];
    NSDate *todayStart = [self.formatter_transverse_yyyy_MM_dd dateFromString:todayString];
    NSTimeInterval todayStartValue = todayStart.timeIntervalSince1970;
    NSTimeInterval todayEndValue = todayStartValue + 24*3600 - 1;
    NSInteger past = (days - 1) * 24 * 3600;
    NSTimeInterval startValue = past >= 0 ? todayStartValue - past : todayStartValue;

    if (block) {
        block(startValue, todayEndValue);
    }
}

@end
