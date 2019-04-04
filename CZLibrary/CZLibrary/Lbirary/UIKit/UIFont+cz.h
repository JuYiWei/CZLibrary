//
//  UIFont+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/13.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CZFont(value)           [UIFont systemFontOfSize:value]
#define CZFontBold(value)       [UIFont boldSystemFontOfSize:value]
#define CZFontName(name, value) [UIFont fontWithName:name size:value]

@interface UIFont (cz)

@end
