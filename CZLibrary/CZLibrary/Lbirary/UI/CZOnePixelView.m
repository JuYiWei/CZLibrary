//
//  CZOnePixelView.m
//  Library
//
//  Created by juyiwei on 2018/9/4.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "CZOnePixelView.h"

@implementation CZOnePixelView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.constant == 1.0 && obj.priority != 1000) {
            obj.constant = 1.0/[UIScreen mainScreen].scale;
        }
    }];
}

@end
