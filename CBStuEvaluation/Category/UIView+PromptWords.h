//
//  UIView+PromptWords.h
//  renrentong
//
//  Created by 流川枫 on 16/11/2.
//  Copyright © 2016年 com.lanxum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PromptWords)

//  提示信息
- (void)showPromptWords:(NSString *) Message image:(NSString *)image;

//  移除
- (void)removePromptWords;

//  文字和显示位置-返回一自定义视图
+ (UIView*)getPromptWordsWithTitle:(NSString*) title Font:(CGFloat) font TextColor:(UIColor*) color Frame:(CGRect) frame;


@end
