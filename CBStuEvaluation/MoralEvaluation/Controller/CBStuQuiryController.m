//
//  CBStuQuiryController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/31.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBStuQuiryController.h"
#import "CBEvlListCell.h"
#import "CBFateDataFactory.h"

@interface CBStuQuiryController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CBStuQuiryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.allArrays addObjectsFromArray:[CBFateDataFactory groupDetailDataSource]];
    
    [self initUI];
}

- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClick {
 
}

//- (void)loadMore:(BOOL)isMore {
//    __weak typeof(self) weakSelf = self;
//
//    [weakSelf endHeaderFooterRefreshing];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CBEvlListCell *cell = [[CBEvlListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBEvlListCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)initUI {
//    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick)];
//    [leftBarButtonItem setTintColor:[UIColor whiteColor]];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
//    
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查询" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
//    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight-44) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
//    self.tableView.frame = CGRectMake(20, 0, SCREEN_WIDTH-100, SCREEN_HEIGHT-kNaviHeight-44);
    self.tableView.rowHeight = 300+15;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGFLOAT_MIN)];
    self.tableView.sectionFooterHeight = CGFLOAT_MIN;
    [self.tableView registerClass:[CBEvlListCell class] forCellReuseIdentifier:@"CBEvlListCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 44;
    }
    return 15;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

@end
