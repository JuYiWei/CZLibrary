//
//  CZLog.h
//  Library
//
//  Created by juyiwei on 2018/9/17.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CocoaLumberjack/CocoaLumberjack.h>

// 使用常量的好处是，修改 level 时不需要大量宏替换二增加重新编译时间
//FOUNDATION_EXTERN NSInteger const CZLogLevel;
//#define ddLogLevel CZLogLevel

//#define CZLogError(frmt, ...)       DDLogError(@">>>>>> Error\n%s - line【%d】\n%@\n\n",__func__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__]);
//#define CZLogWarn(frmt, ...)        DDLogWarn(@">>>>>> Warn\n%s - line【%d】\n%@\n\n",__func__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__]);
//#define CZLogInfo(frmt, ...)        DDLogInfo(@">>>>>> Info\n%s - line【%d】\n%@\n\n",__func__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__]);
//#define CZLogDebug(frmt, ...)       DDLogDebug(@">>>>>> Debug\n%s - line【%d】\n%@\n\n",__func__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__]);
//#define CZLogVerbose(frmt, ...)     DDLogVerbose(@">>>>>> Verbose\n%s - line【%d】\n%@\n\n",__func__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__]);

/**
 Error: 错误信息
 Waring: 警告信息
 Info: 调式数据
 Debug: 调试过程
 Verbose: 其他信息
 */
@interface CZLog : NSObject

/**
 基本配置 Log
 */
+ (void)cz_configLog;


@end
