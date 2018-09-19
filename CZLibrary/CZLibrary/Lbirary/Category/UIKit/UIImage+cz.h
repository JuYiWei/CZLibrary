//
//  UIImage+cz.h
//  Library
//
//  Created by juyiwei on 2018/9/11.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CZImage(name) [UIImage imageNamed:name]

@interface UIImage (cz)

+ (UIImage *)cz_imageFromColor:(UIColor *)color;

- (NSString *)cz_scanQRCodeFromImage;

+ (UIImage *)cz_createQRImageWithContent:(NSString *)content scale:(CGFloat)scale;


@end
