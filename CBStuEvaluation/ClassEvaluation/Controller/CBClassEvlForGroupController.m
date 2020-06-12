//
//  CBClassEvlForGroupController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassEvlForGroupController.h"
#import "CBForGroupCell.h"
#import "CBFateDataFactory.h"

#import "ListTypeByCourse.h"
//#import "CBGoupScoreModel.h"
#import "ListGroupUsers.h"

static NSString *identifier = @"CBForGroupCell";

@interface CBClassEvlForGroupController ()

@end

@implementation CBClassEvlForGroupController

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
        
        
        [BaseHandler executeRequestWithURL:kApi_ListTypeByCourse headers:kToken params:@{@"courseId": @"6202"} success:^(id json) {
            
            if ([json[@"result"] integerValue] == 1) {
                NSArray <ListTypeByCourse *>*typeList = [ListTypeByCourse mj_objectArrayWithKeyValuesArray:json[@"data"]];
                
                if (typeList.count != 0) {
                    ListTypeByCourse *type = typeList[0];
                    
                    [BaseHandler executeRequestWithURL:kApi_ListGroupingByUser headers:kToken params:@{@"typeId": type.itemId} success:^(id json) {
                        if ([json[@"result"] integerValue] == 1) {
                            NSArray <ListGroupUsers *>*array = [ListGroupUsers mj_objectArrayWithKeyValuesArray:json[@"data"]];
                            
                            [array enumerateObjectsUsingBlock:^(ListGroupUsers * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                __block NSInteger scores = 0;
                                [obj.users enumerateObjectsUsingBlock:^(User * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                    scores = scores + obj.score;
                                }];
                                TableViewBaseItem *item = [[TableViewBaseItem alloc] initWithImage:nil title:[NSString stringWithFormat:@"第%@", obj.name] subTitle:[NSString stringWithFormat:@"合计%ld分", scores] accessoryImage:nil];
                                item.itemId = obj.itemId;
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
                    
                }
                
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
