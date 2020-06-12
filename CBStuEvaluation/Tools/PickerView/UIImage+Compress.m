//
//  UIImage+Compress.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/19.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)

+ (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth {
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width) *height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)rescaleImage{
    CGSize size = self.size;
    if(size.width <= 600 && size.height <= 800) {
        return self;
    }
    
    CGFloat width =size.width;
    CGFloat height = size.height;
    CGFloat sampleSize = width/height;
    UIImage * newImage = self;
    if (sampleSize < 0.5) {
        if (width > 600) {
            newImage = [self rescaleImageWithWidth:600];
        }
        return [newImage rescaleImageToSize:CGSizeMake(width, 800) Point: CGPointMake(0, (height - 800)/2)];
    }else if (sampleSize > 2) {
        if (height > 800) {
            newImage = [self rescaleImageWithHeight:800];
        }
        return  [newImage rescaleImageToSize:CGSizeMake(600, height) Point: CGPointMake((width - 600)/2, 0)];
    }
    
    return [self rescaleImageWithSize:size];
}

- (UIImage *)rescaleImageWithWidth:(CGFloat) width{
    CGFloat scale = self.size.width / self.size.height;
    CGSize size = self.size;
    size.width = 600.f;
    size.height = size.width / scale;
    UIImage * resImage = [self rescaleImageToSize:size];
    return resImage;
}

- (UIImage *)rescaleImageWithHeight:(CGFloat) height{
    CGFloat scale = self.size.width / self.size.height;
    CGSize size = self.size;
    size.height = 800.f;
    size.width = size.height * scale;
    UIImage * resImage = [self rescaleImageToSize:size];
    return resImage;
}

- (UIImage *)rescaleImageWithSize:(CGSize) size{
    CGFloat scale = size.width / size.height;
    if(size.width > size.height) {
        size.width = 600.f;
        size.height = size.width / scale;
    } else {
        size.height = 800.f;
        size.width = size.height * scale;
    }
    UIImage * resImage = [self rescaleImageToSize:size];
    return resImage;
}

- (UIImage *)rescaleImageToSize:(CGSize)size Point:(CGPoint) point{
    
    CGRect rect = (CGRect){point, size};
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(point.x, point.y, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}


- (UIImage *)rescaleImageToSize:(CGSize)size {
    CGRect rect = (CGRect){CGPointZero, size};
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

@end
