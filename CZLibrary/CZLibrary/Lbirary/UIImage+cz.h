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

/**
 颜色 转 图片 1x1 大小

 @param color color
 @return image
 */
+ (UIImage *)cz_imageFromColor:(UIColor *)color;

/**
 扫描图片二维码

 @return string
 */
- (NSString *)cz_scanQRCodeFromImage;

/**
 生成二维码图片

 @param content 文本内容
 @param scale 放大w倍数
 @return image
 */
+ (UIImage *)cz_createQRImageWithContent:(NSString *)content scale:(CGFloat)scale;

@end
