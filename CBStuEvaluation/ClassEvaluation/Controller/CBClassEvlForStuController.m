//
//  CBClassEvlForStuController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassEvlForStuController.h"
#import "CBForGroupCell.h"
#import "CBFateDataFactory.h"

#import "ListGroupUsers.h"

static NSString *identifier = @"CBForStuCell";

@interface CBClassEvlForStuController ()

@end

@implementation CBClassEvlForStuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.allArrays addObjectsFromArray:[CBFateDataFactory groupListDataSource]];
    
    [self initUI];
}

- (void)loadMore:(BOOL)isMore {
    if (!isMore) {//下拉刷新
        self.pageNum = 1;
        [self.tableView.mj_footer resetNoMoreData];
        [self.allArrays removeAllObjects];
    }
    
    __weak __typeof(self) weakSelf = self;
    
    [GCDQueue executeInGlobalQueue:^{
        [BaseHandler executeRequestWithURL:kApi_ListStudentByCourseId headers:kToken params:@{@"courseId": @"6202",@"seatId": @"1"} success:^(id json) {
            if ([json[@"result"] integerValue] == 1) {
                NSArray *array = [User mj_objectArrayWithKeyValuesArray:json[@"data"]];

                [array enumerateObjectsUsingBlock:^(User *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    TableViewBaseItem *item = [[TableViewBaseItem alloc] initWithImage:nil title:obj.name subTitle:[NSString stringWithFormat:@"合计%ld分", obj.score] accessoryImage:nil];
                    item.itemId = obj.usersId;
                    [self.allArrays addObject:item];
                }];

                [weakSelf endHeaderFooterRefreshing];
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];

                [GCDQueue executeInMainQueue:^{
                    [weakSelf.tableView reloadData];
                }];
                
            }else{
                
            }
        } failure:^(NSError *error) {
            
        }];
        
    }];
}


#pragma mark - initUI

- (void)initUI {

    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight-44);
    self.tableView.rowHeight = 44;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[CBForGroupCell class] forCellReuseIdentifier:identifier];
    TableViewCellConfigureBlock block =  ^(CBForGroupCell *cell, TableViewBaseItem *item){
        cell.item = item;
    };
    self.tableViewDataSource = [[TableViewDataSource alloc] initWithItems:self.allArrays cellIdentifier:identifier configureCellBlock:block];
    self.tableView.dataSource = self.tableViewDataSource;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //    CBSeatDetailController *seatDetailVC = [[CBSeatDetailController alloc] initWithTitle:self.allArrays[indexPath.row][@"text"]];
    //    [self.navigationController pushViewController:seatDetailVC animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 4;
}

@end
