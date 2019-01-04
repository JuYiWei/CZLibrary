//
//  CZDevice.m
//  CZLibrary
//
//  Created by juyiwei on 2018/12/24.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZDevice.h"
#include  <sys/utsname.h>

@implementation CZDevice

+ (NSString *)cz_deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    return [NSString stringWithFormat:@"%@", machine];
}


@end
