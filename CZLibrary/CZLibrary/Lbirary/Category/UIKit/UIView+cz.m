//
//  UIView+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/5.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "UIView+cz.h"

@implementation UIView (cz)

- (UIImage *)cz_viewCapture {
    UIImage* image = nil;
    UIGraphicsBeginImageContext(self.bounds.size);
    {
        self.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}

@end
