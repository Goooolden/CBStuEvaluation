//
//  TableViewController.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic, assign) UITableViewStyle tableViewStyle;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseTableViewUI];
}

- (void)dealloc {
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super init]) {
        _tableViewStyle = style;
    }
    return self;
}

- (void)setupBaseTableViewUI {
    self.tableView.backgroundColor = self.view.backgroundColor;
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        tableView.separatorColor = RGB16(0xd9d9d9);
        _tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:tableView];
        tableView.dataSource = self;
        tableView.delegate = self;
        _tableView = tableView;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

@end
