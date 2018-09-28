//
//  UIScrollView+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/3.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "UIScrollView+cz.h"

@implementation UIScrollView (cz)

- (UIImage *)cz_scrollerViewCapture {
    UIImage* image = nil;
    UIGraphicsBeginImageContext(self.contentSize);
    {
        CGPoint savedContentOffset = self.contentOffset;
        CGRect savedFrame = self.frame;
        self.contentOffset = CGPointZero;
        self.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        self.contentOffset = savedContentOffset;
        self.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    return image;
}

@end
