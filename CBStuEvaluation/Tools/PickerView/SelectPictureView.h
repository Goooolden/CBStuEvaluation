//
//  SelectPictureView.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/19.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZImagePickerController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectPictureView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL okBtnAnimated;
//  可选照片数
@property (nonatomic, assign) NSInteger maxPhotoNum;
//  每行可显示几张图片
@property (nonatomic, assign) NSInteger maxLineNum;
//  选中的照片
@property (nonatomic, strong) NSMutableArray *selectedPhotos;
//  照片配置
@property (nonatomic, strong) NSMutableArray *selectedAssets;
//  相册选择回调
@property (nonatomic, copy) void(^FinishPickingPhotosHandle)(NSArray<UIImage *> *photos);
//  相机拍照回调
@property (nonatomic, copy) void(^FinishtakePhotosHandle)(UIImage *photos, id asset);
//  打开相册
- (void)pushImagePickerController;
/** 打开相机 */
- (void)takePhoto;
//  初始化 视图最大宽度
- (instancetype)initWithMaxWidth:(CGFloat) maxWidth;

@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
