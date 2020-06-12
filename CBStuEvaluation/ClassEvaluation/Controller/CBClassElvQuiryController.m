//
//  CBClassElvQuiryController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassElvQuiryController.h"
#import <VTMagic/VTMagic.h>
#import "CBClassEvlForSeatController.h"
#import "CBClassEvlForGroupController.h"
#import "CBClassEvlForStuController.h"
#import "CBFillInClassEvlController.h"


static NSString *itemIdentifier = @"itemIdentifier";

@interface CBClassElvQuiryController ()<VTMagicViewDataSource, VTMagicViewDelegate>

@property (nonatomic, strong) VTMagicController *magicController;
@property (nonatomic, copy) NSArray *menuList;

@end

@implementation CBClassElvQuiryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [barItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = barItem;
    
    [self addChildViewController:self.magicController];
    [self.view addSubview:_magicController.view];
    [_magicController.magicView reloadData];
}

- (void)rightBarButtonClick {
//    CBFillInClassEvlController *fillInClassEvlVC = [[CBFillInClassEvlController alloc] initWithTitle:@"课堂评价(2/2)"];
//    [self.navigationController pushViewController:fillInClassEvlVC animated:YES];
}

#pragma mark - VTMagicViewDataSource

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    return self.menuList;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [menuItem setTitleColor:[UIColor colorWithHexString:@"#38383d" alpha:1] forState:UIControlStateNormal];
        [menuItem setTitleColor:[UIColor colorWithHexString:@"#007aff" alpha:1] forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont boldSystemFontOfSize:14];;
        
    }
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    BaseController *controller = [[BaseController alloc] init];
    if (pageIndex == 0) {
        controller =  [[CBClassEvlForSeatController alloc] init];
    } else if(pageIndex == 1){
        controller = [[CBClassEvlForGroupController alloc] init];
    }else {
        controller = [[CBClassEvlForStuController alloc] init];
    }
    return controller;
}


#pragma mark - accessor methods
- (VTMagicController *)magicController {
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.magicView.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight);
        _magicController.view.translatesAutoresizingMaskIntoConstraints = NO;
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.scrollEnabled = NO;
        _magicController.magicView.sliderColor = [UIColor colorWithHexString:@"#007aff" alpha:1];
        _magicController.magicView.sliderExtension = 20;
        _magicController.magicView.switchStyle = VTSwitchStyleDefault;
        _magicController.magicView.layoutStyle = VTLayoutStyleDivide;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
    }
    return _magicController;
}

- (NSArray *)menuList {
    if (!_menuList) {
        _menuList = @[@"按座次", @"按分组", @"按学生"];
    }
    return _menuList;
}

@end
