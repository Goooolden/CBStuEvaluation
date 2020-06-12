//
//  UILabel+Extension.h
//  renrentong
//
//  Created by 流川枫 on 16/7/21.
//  Copyright © 2016年 com.lanxum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (UILabel*)lableWithStr:(NSString *) title Color:(NSString*) colorStr Font:(CGFloat) font;
+ (UILabel*)lableWithTitle:(NSString *) title Color:(UIColor*) color Font:(CGFloat) font;
@end
