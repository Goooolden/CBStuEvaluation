//
//  CBMoralRecordListController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/31.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBMoralRecordListController.h"
#import <VTMagic/VTMagic.h>
#import "CBStuQuiryController.h"

static NSString *itemIdentifier = @"itemIdentifier";

@interface CBMoralRecordListController ()<VTMagicViewDataSource, VTMagicViewDelegate>

@property (nonatomic, strong) VTMagicController *magicController;
@property (nonatomic, copy) NSArray *menuList;

@end

@implementation CBMoralRecordListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

//- (void)loadMore:(BOOL)isMore {
//    __weak typeof(self) weakSelf = self;
//    
//    [weakSelf endHeaderFooterRefreshing];
//}
    
    

- (void)initUI {
    
    self.title = @"记录查询";

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [barItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = barItem;
    
    [self addChildViewController:self.magicController];
    [self.view addSubview:_magicController.view];
    [_magicController.magicView reloadData];
}

- (void)rightBarButtonClick {
//    CBFillInClassEvlController *groupAddVC = [[CBFillInClassEvlController alloc] initWithTitle:@"课堂评价(2/2)"];
//    [self.navigationController pushViewController:groupAddVC animated:YES];
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
    CBStuQuiryController *controller =  [[CBStuQuiryController alloc] init];
    return controller;
}


#pragma mark - accessor methods
- (VTMagicController *)magicController {
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.magicView.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight);
        _magicController.view.translatesAutoresizingMaskIntoConstraints = NO;
        _magicController.magicView.navigationColor = [UIColor whiteColor];
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
        _menuList = @[@"评学生", @"按班级", @"按宿舍"];
    }
    return _menuList;
}

@end
