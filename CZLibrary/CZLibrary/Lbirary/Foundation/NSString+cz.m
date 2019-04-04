//
//  NSString+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/13.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "NSString+cz.h"

@implementation NSString (cz)

- (CGRect)cz_rectWithFont:(UIFont *)font {
    return [self boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil];;
}

@end
