//
//  UIImage+cz.m
//  Library
//
//  Created by juyiwei on 2018/9/11.
//  Copyright © 2018 居祎炜. All rights reserved.
//

#import "UIImage+cz.h"

@implementation UIImage (cz)

+ (UIImage *)cz_imageFromColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return theImage;
}

- (NSString *)cz_scanQRCodeFromImage {
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy:CIDetectorAccuracyHigh }];
    CIImage *image = [[CIImage alloc] initWithImage:self];
    NSArray *features = [detector featuresInImage:image];
    CIQRCodeFeature *feature = [features firstObject];
    if (feature) {
        return feature.messageString;
        
    } else {
        return @"没有二维码";
    }
}

+ (UIImage *)cz_createQRImageWithContent:(NSString *)content scale:(CGFloat)scale {
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];// L: 7% M: 15% Q: 25% H: 30%
    CIImage *outputImage = filter.outputImage;
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale); // scale 为放大倍数
    CIImage *transformImage = [outputImage imageByApplyingTransform:transform];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:transformImage fromRect:transformImage.extent];
    UIImage *qrCodeImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return qrCodeImage;
}

@end
