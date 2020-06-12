//
//  CBClassRecordListController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassRecordListController.h"
#import "CBClassRecordCell.h"
#import "CBFateDataFactory.h"
#import "CBClassRecordQuiryController.h"

#import "CBClassRecordList.h"

static NSString *identifier = @"CBClassRecordCell";

@interface CBClassRecordListController ()

@property (nonatomic, strong) UILabel *headerLabel;

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *sDate;
@property (nonatomic, copy) NSString *eDate;

@end

@implementation CBClassRecordListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.allArrays addObjectsFromArray:[CBFateDataFactory classRecordDataSource]];
    
    self.className = @" ";
    
    self.sDate = [self getCurrentTime];
    self.eDate = [self getCurrentTime];
    
    [self initUI];
}

- (void)loadMore:(BOOL)isMore {
    if (!isMore) {//下拉刷新
        self.pageNum = 1;
        [self.tableView.mj_footer resetNoMoreData];
        [self.allArrays removeAllObjects];
    }
    __weak typeof(self) weakSelf = self;
    [GCDQueue executeInGlobalQueue:^{
        [BaseHandler executeRequestWithURL:kApi_InquireScores headers:kToken params:@{@"page": @(self.pageNum), @"pageSize": @"10", @"sdate": self.sDate, @"edate": self.eDate, @"clazz_id": self.className} success:^(id json) {
            
            if ([json[@"result"] integerValue] == 1) {
                CBClassRecordList *list = [CBClassRecordList mj_objectWithKeyValues:json[@"data"]];
                self.headerLabel.text = [NSString stringWithFormat:@"共找到%ld条记录", list.total];
                if (list.total == 0) {
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView.mj_footer endRefreshing];
                    [weakSelf.tableView showPromptWords:@"暂无数据~" image:@"no_resource_icon"];
                    return;
                }
                [weakSelf.tableView removePromptWords];
                [self.allArrays addObject:list.list];
                if (list.hasNextPage) {
                    self.pageNum++;
                } else {
                    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.tableView reloadData];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
        
    }];
    
    [weakSelf endHeaderFooterRefreshing];
    
    
}

- (void)rightBarButtonClick {
    CBClassRecordQuiryController *classRecordQuiryController = [[CBClassRecordQuiryController alloc] initWithStyle:UITableViewStylePlain];
    classRecordQuiryController.title = @"记录查询";
    
    classRecordQuiryController.keyWord = ^(NSString * _Nonnull className, NSString * _Nonnull sDate, NSString * _Nonnull eDate) {
        self.className = className;
        self.sDate = sDate;
        self.eDate = eDate;
        
        if (self.allArrays.count != 0) {
            NSIndexPath *indexPat = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView scrollToRowAtIndexPath:indexPat atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
        [self loadMore:YES];
    };
    
    [self.navigationController pushViewController:classRecordQuiryController animated:YES];
}

#pragma mark - initUI

- (void)initUI {
    self.title = @"记录查询";
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [barItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = barItem;
    
    self.tableView.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight);
    
    self.tableView.tableHeaderView = self.headerLabel;
    self.headerLabel.text = @"共找到12条记录";
    
    self.tableView.rowHeight = 100;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorColor = [UIColor whiteColor];
    [self.tableView registerClass:[CBClassRecordCell class] forCellReuseIdentifier:identifier];
    TableViewCellConfigureBlock block =  ^(CBClassRecordCell *cell, RecordItem *item){
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

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return 0;
//    }
//    return 12;
//}

- (UILabel *)headerLabel {
    if (!_headerLabel) {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
        _headerLabel.font = MediumFont(16);
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        _headerLabel.textColor = RGB16(0xc7c7c7);
        _headerLabel.backgroundColor = [UIColor  groupTableViewBackgroundColor];
    }
    return _headerLabel;
}

- (NSString *)getCurrentTime {
    NSDate *date = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt stringFromDate:date];
}

@end
