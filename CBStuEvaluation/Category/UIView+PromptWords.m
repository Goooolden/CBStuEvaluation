//
//  UIView+PromptWords.m
//  renrentong
//
//  Created by 流川枫 on 16/11/2.
//  Copyright © 2016年 com.lanxum. All rights reserved.
//

#import "UIView+PromptWords.h"


@implementation UIView (PromptWords)


//  提示信息
- (void)showPromptWords:(NSString *) Message image:(NSString *)image {
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    textLable.tag = 99901;
    textLable.text = Message;
    textLable.numberOfLines = 0;
    textLable.font = [UIFont systemFontOfSize:16.f];
    textLable.textAlignment = NSTextAlignmentCenter;
    textLable.textColor = [UIColor grayColor];
    textLable.center = self.center;
    textLable.y = self.bounds.size.height/2 - 50;
    [self addSubview:textLable];
    
    UIImageView * iv = [[UIImageView alloc] init];
    iv.tag = 99901;
    iv.image = [UIImage imageNamed:image];
    iv.frame = CGRectMake(0, 50, 200, 170);
    iv.center = self.center;
    iv.y = self.bounds.size.height/2 - 220;
    [self addSubview:iv];
}

//  移除
- (void)removePromptWords{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 99901) {
            [subView removeFromSuperview];
        }
    }
}

//  自定义
+ (UIView*)getPromptWordsWithTitle:(NSString*) title Font:(CGFloat) font TextColor:(UIColor*) color Frame:(CGRect) frame{
    UILabel *textLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    textLable.text = title;
    textLable.numberOfLines = 0;
    textLable.font = [UIFont systemFontOfSize:font];
    textLable.textAlignment = NSTextAlignmentCenter;
    textLable.textColor = color;
    UIView *PromptView = [[UIView alloc]initWithFrame:frame];
    textLable.center = PromptView.center;
    [PromptView addSubview:textLable];
    PromptView.tag = 99901;
    return PromptView;
}

@end
