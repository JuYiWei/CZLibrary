//
//  CZDateTransform.h
//  Library
//
//  Created by juyiwei on 2018/9/6.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZLibraryMacro.h"

typedef NS_ENUM(NSInteger, CZDateToolType) {
    
    /*! 2018-09-09 09:09:09 */
    CZDateToolType_Transverse_yyyy_MM_dd_HH_mm_ss = 0,
    /*! 2018-09-09 09:09 */
    CZDateToolType_Transverse_yyyy_MM_dd_HH_mm,
    /*! 2018-09-09 */
    CZDateToolType_Transverse_yyyy_MM_dd,
    /*! 2018-09 */
    CZDateToolType_Transverse_yyyy_MM,
    
    /*! 2018.09.09 09:09:09 */
    CZDateToolType_Point_yyyy_MM_dd_HH_mm_ss,
    /*! 2018.09.09 09:09 */
    CZDateToolType_Point_yyyy_MM_dd_HH_mm,
    /*! 2018.09.09 */
    CZDateToolType_Point_yyyy_MM_dd,
    /*! 2018.09 */
    CZDateToolType_Point_yyyy_MM,
    
    /*! 2018/09/09 09/09/09 */
    CZDateToolType_Slash_yyyy_MM_dd_HH_mm_ss,
    /*! 2018/09/09 09/09 */
    CZDateToolType_Slash_yyyy_MM_dd_HH_mm,
    /*! 2018/09/09 */
    CZDateToolType_Slash_yyyy_MM_dd,
    /*! 2018/09 */
    CZDateToolType_Slash_yyyy_MM,
    
    /*! 2018年09月09日 09时09分09秒 */
    CZDateToolType_Chinese_yyyy_MM_dd_HH_mm_ss,
    /*! 2018年09月09日 09时09分 */
    CZDateToolType_Chinese_yyyy_MM_dd_HH_mm,
    /*! 2018年09月09日 */
    CZDateToolType_Chinese_yyyy_MM_dd,
    /*! 2018年09月 */
    CZDateToolType_Chinese_yyyy_MM,
    
    /*! 09:09:09 */
    CZDateToolType_Normal_HH_mm_ss,
    /*! 09:09 */
    CZDateToolType_Normal_HH_mm,
    
    /*! 09时09分09秒 */
    CZDateToolType_Chinese_HH_mm_ss,
    /*! 09时09分 */
    CZDateToolType_Chinese_HH_mm
};

/*! 时间格式化工具，使用单例，因为格式化部分创建消耗较大，使用单例仅创建一次，提高性能 */
@interface CZDateTransform : NSObject

CZ_SINGLETON_HEADER(CZDateTransform)

#pragma mark - General transform

/**
 时间 转 字符串

 @param date 时间
 @param type 类型
 @return 时间字符串
 */
- (NSString *)cz_stringFromDate:(NSDate *)date type:(CZDateToolType)type;

/**
 时间戳 转 字符串

 @param timestamp 时间戳 秒级
 @param type 类型
 @return 时间字符
 */
- (NSString *)cz_stringFromTimestamp:(NSTimeInterval)timestamp type:(CZDateToolType)type;

/**
 字符串 转 时间

 @param string 字符串
 @param type 类型
 @return 时间
 */
- (NSDate *)cz_dateFromString:(NSString *)string type:(CZDateToolType)type;

/**
 字符串 转 时间戳
 
 @param string 字符串
 @param type 类型
 @return 时间戳 秒级
 */
- (NSTimeInterval)cz_timestampFromString:(NSString *)string type:(CZDateToolType)type;

/**
 最近 n 天的开始与结束的时间（2018-09-09 00:00:00 -> 2018-09-10 23:59:59）

 @param days 最近 n 天
 @param block block 时间戳范围
 */
- (void)cz_timestampRangeLastDays:(NSInteger)days block:(void(^)(NSTimeInterval start, NSTimeInterval end))block;

@end
