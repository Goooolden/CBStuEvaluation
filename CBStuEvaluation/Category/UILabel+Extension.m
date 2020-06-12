//
//  UILabel+Extension.m
//  renrentong
//
//  Created by 流川枫 on 16/7/21.
//  Copyright © 2016年 com.lanxum. All rights reserved.
//

#import "UILabel+Extension.h"
#import "UIColor+RCColor.h"
@implementation UILabel (Extension)

+ (UILabel*)lableWithStr:(NSString *) title Color:(NSString*) colorStr Font:(CGFloat) font{
    UILabel *lable = [[UILabel alloc]init];
    lable.font = [UIFont systemFontOfSize:font];
    lable.textColor = [UIColor colorWithHexString:colorStr alpha:1];
    lable.text = title;
    return lable;
}

+ (UILabel*)lableWithTitle:(NSString *) title Color:(UIColor*) color Font:(CGFloat) font{
    UILabel *lable = [[UILabel alloc]init];
    lable.font = [UIFont systemFontOfSize:font];
    lable.textColor = color;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = title;
    return lable;
}
@end
