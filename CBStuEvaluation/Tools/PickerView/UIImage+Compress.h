//
//  UIImage+Compress.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/19.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Compress)

/*!
 *
 * 压缩图片至目标尺寸
 *
 * @param sourceImage 源图片
 * @param targetWidth 图片最终尺寸的宽
 *
 * @return 返回按照源图片的宽、高比例压缩至目标宽、高的图片
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth;

/** 图片压缩 */
- (UIImage *)rescaleImage;

@end

NS_ASSUME_NONNULL_END
