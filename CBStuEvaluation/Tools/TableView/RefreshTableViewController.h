//
//  RefreshTableViewController.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewController.h"
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface RefreshTableViewController : TableViewController

/** 数据源*/
@property (nonatomic, strong) NSMutableArray *allArrays;

@property (nonatomic, assign) NSInteger pageNum;

- (void)loadMore:(BOOL)isMore;

/** 结束刷新, 子类请求报文完毕调用*/
- (void)endHeaderFooterRefreshing;

@end

NS_ASSUME_NONNULL_END
