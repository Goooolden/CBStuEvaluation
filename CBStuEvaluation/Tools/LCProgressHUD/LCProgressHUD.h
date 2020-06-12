//
//  LCProgressHUD.h
//
//
//  Created by liuchuan on 17/1/12.
//  Copyright © 2017年 com.lanxum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>


@interface LCProgressHUD : NSObject
@property (nonatomic,strong) MBProgressHUD  *HUD;
+ (instancetype)shareInstance;

// 加载菊花
+ (void)showInView:(UIView *)view;

//  加载菊花,带文字
+ (void)showProgress:(NSString *)msg inView:(UIView *)view;

//  显示成功提示
+ (void)showSuccess:(NSString *)msg inview:(UIView *)view;

//  显示失败提示
+ (void)showError:(NSString *)msg inview:(UIView *)view;

//  显示文字底部-默认
+ (void)showMessage:(NSString *)msg;

//  显示文字(中间显示)
+ (void)showMessageCenter:(NSString *) msg;

//  隐藏
+ (void)hide;

//  隐藏多少秒之后
+ (void)hideDelayTime:(NSInteger) seconds;

@end
