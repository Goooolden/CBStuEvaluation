//
//  LCProgressHUD.m
//
//
//  Created by liuchuan on 17/1/12.
//  Copyright © 2017年 com.lanxum. All rights reserved.
//

#import "LCProgressHUD.h"

//  提示类型
typedef NS_ENUM(NSInteger, LCProgressHUDType){
    LCProgressHUDTypeJHLoading,                 //菊花
    LCProgressHUDTypeOnlyText,                  //文字底部显示
    LCProgressHUDTypeOnlyTextCenter,            //文字中间显示
    LCProgressHUDTypeSuccess,                   //成功
    LCProgressHUDTypeError,                     //失败
    LCProgressHUDTypeCustomAnimation,           //自定义加载动画（序列帧实现）
};

@interface LCProgressHUD ()

@end

@implementation LCProgressHUD

+ (instancetype)shareInstance{
    
    static LCProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LCProgressHUD alloc] init];
    });
    return instance;
}


+ (void)show:(NSString *)msg inView:(UIView *)view type:(LCProgressHUDType) mytype{
    [self show:msg inView:view type:mytype customImgView:nil];
}

+ (void)show:(NSString *)msg inView:(UIView *)view type:(LCProgressHUDType)mytype customImgView:(UIImageView *)customImgView{
    
    if ([LCProgressHUD shareInstance].HUD != nil) {
        [[LCProgressHUD shareInstance].HUD hideAnimated:NO];
        [LCProgressHUD shareInstance].HUD = nil;
    }
    
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [LCProgressHUD shareInstance].HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    [LCProgressHUD shareInstance].HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [LCProgressHUD shareInstance].HUD.backgroundColor = [UIColor clearColor];
    
    
    [LCProgressHUD shareInstance].HUD.bezelView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
    [LCProgressHUD shareInstance].HUD.contentColor = [UIColor whiteColor];
    
    [[LCProgressHUD shareInstance].HUD setRemoveFromSuperViewOnHide:YES];
    if(msg)[LCProgressHUD shareInstance].HUD.detailsLabel.text = msg;
    [LCProgressHUD shareInstance].HUD.detailsLabel.font = [UIFont systemFontOfSize:16];
    
    switch (mytype) {
            
        case LCProgressHUDTypeOnlyText:
            [LCProgressHUD shareInstance].HUD.mode = MBProgressHUDModeText;
            [[LCProgressHUD shareInstance].HUD setMargin:15];
            [LCProgressHUD shareInstance].HUD.offset = CGPointMake(0.f, [UIScreen mainScreen].bounds.size.height/2 - 100);
            break;
            
        case LCProgressHUDTypeJHLoading:
            [LCProgressHUD shareInstance].HUD.offset = CGPointMake(0.f, - 50);
            [LCProgressHUD shareInstance].HUD.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case LCProgressHUDTypeSuccess:
            [LCProgressHUD shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            [LCProgressHUD shareInstance].HUD.offset = CGPointMake(0.f, -50);
            [LCProgressHUD shareInstance].HUD.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"success"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            break;
            
        case LCProgressHUDTypeError:
            [LCProgressHUD shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            [LCProgressHUD shareInstance].HUD.offset = CGPointMake(0.f, -50);
            [LCProgressHUD shareInstance].HUD.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            break;
            
        case LCProgressHUDTypeOnlyTextCenter:
            [[LCProgressHUD shareInstance].HUD setMargin:15];
            [LCProgressHUD shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            break;
            
        default:
            break;
    }
}


+ (void)showInView:(UIView *)view{
    [self show:nil inView:view type:LCProgressHUDTypeJHLoading];
}

+ (void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view type:LCProgressHUDTypeJHLoading];
}

+ (void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view type:LCProgressHUDTypeSuccess];
    [[LCProgressHUD shareInstance].HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)showError:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view type:LCProgressHUDTypeError];
    [[LCProgressHUD shareInstance].HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)showMessage:(NSString *)msg{
    [self show:msg inView:nil type:LCProgressHUDTypeOnlyText];
    [[LCProgressHUD shareInstance].HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)showMessageCenter:(NSString *) msg{
    [self show:msg inView:nil type:LCProgressHUDTypeOnlyTextCenter];
    [[LCProgressHUD shareInstance].HUD hideAnimated:YES afterDelay:1.5];
}

+ (void)hide{
    if ([LCProgressHUD shareInstance].HUD != nil) {
        [[LCProgressHUD shareInstance].HUD hideAnimated:YES];
    }
}

+ (void)hideDelayTime:(NSInteger) seconds{
    [[LCProgressHUD shareInstance].HUD hideAnimated:YES afterDelay:seconds];
}

@end
