//
//  RefreshTableViewController.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "RefreshTableViewController.h"

@interface RefreshTableViewController ()

@end

@implementation RefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadIsMore:NO];
    }];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadIsMore:YES];
    }];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadIsMore:(BOOL)isMore {
    // 控制只能下拉或者上拉
    if (isMore) {
        ![self.tableView.mj_header isRefreshing] ?: [self.tableView.mj_header endRefreshing];
    }else
    {
        ![self.tableView.mj_footer isRefreshing] ?: [self.tableView.mj_footer endRefreshing];
    }
    [self loadMore:isMore];
}

- (void)endHeaderFooterRefreshing {
    // 结束刷新状态
    ![self.tableView.mj_header isRefreshing] ?: [self.tableView.mj_header endRefreshing];
    ![self.tableView.mj_footer isRefreshing] ?: [self.tableView.mj_footer endRefreshing];
}

// 子类需要调用调用
- (void)loadMore:(BOOL)isMore {
    
}

#pragma mark - 懒加载
- (NSMutableArray *)allArrays {
    if (!_allArrays) {
        _allArrays = [[NSMutableArray alloc] init];
    }
    return _allArrays;
}

@end
