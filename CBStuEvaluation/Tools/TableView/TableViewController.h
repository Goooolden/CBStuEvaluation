//
//  TableViewController.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "BaseController.h"
#import "TableViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : BaseController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

/** UITableViewDataSource的封装*/
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;

// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

// tableview的样式, 默认plain
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end

NS_ASSUME_NONNULL_END
