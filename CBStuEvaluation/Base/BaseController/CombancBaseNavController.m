//
//  CombancBaseNavController.m
//  CombancClassAttendance
//
//  Created by Mac on 2018/9/18.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CombancBaseNavController.h"

@interface CombancBaseNavController ()

@end

@implementation CombancBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/** push样式 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSInteger count = self.childViewControllers.count;
    if (count >= 1) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_Back" title:@"" target:self action:@selector(popViewController)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //  解决iPhoneX push页面时tabbar上移问题
    [super pushViewController:viewController animated:animated];
    if (IS_IPHONE_X) {
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = SCREEN_HEIGHT - frame.size.height;
        self.tabBarController.tabBar.frame = frame;
    }
}

/** 显示样式 */
+ (void)initialize{
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Semibold" size:18],
                                     NSForegroundColorAttributeName:[UIColor colorWithRed:253.0/255.0 green:253.0/255.0 blue:254.0/255.0 alpha:1]
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    [[UINavigationBar appearance] setBarTintColor:RGBA(56, 56, 61, 1)];
}

/** popback */
- (void)popViewController{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
