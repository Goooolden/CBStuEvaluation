//
//  CBClassRecordQuiryController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/30.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassRecordQuiryController.h"
#import "CBFiltrateCell.h"
#import "CombancPickerView.h"
#import "MyDateTimeView.h"
#import "CBFateDataFactory.h"
#import "CBFillInClassEvlController.h"


#import "CBClassRecordList.h"

static NSString *identifier = @"CBFiltrateCell";

@interface CBClassRecordQuiryController ()

@property (nonatomic, strong) NSMutableArray *gradeArr;
@property (nonatomic, strong) NSMutableArray *classArr;
//@property (nonatomic, strong) NSMutableArray *subjectArr;

@property (nonatomic, strong) CombancPickerView *gradePickView;
//@property (nonatomic, strong) CombancPickerView *subjectPickView;
@property (nonatomic, strong) MyDateTimeView *dateTimeView;

@property (nonatomic, strong) NSMutableArray *allArrays;


@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *sDate;
@property (nonatomic, copy) NSString *eDate;

@end

@implementation CBClassRecordQuiryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allArrays = [NSMutableArray arrayWithArray:[CBFateDataFactory classTimeDataSource]];
    [self initUI];
    
    self.gradeArr = [NSMutableArray array];
    self.classArr = [NSMutableArray array];
//    [self loadData];
    
    [self loadClassData];
}

- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClick {
    if (self.className.length == 0 && self.sDate.length == 0 && self.eDate.length == 0) {
        NSLog(@"至少选择一个筛选条件哦~");
        return;
    }
    if (self.keyWord != nil) {
        if (self.className.length == 0) {
            self.className = @" ";
        }
        if (self.sDate.length == 0) {
            self.sDate = @" ";
        }
        if (self.eDate.length == 0) {
            self.eDate = @" ";
        }
        self.keyWord(self.className, self.sDate, self.eDate);
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)loadClassData {
    [BaseHandler executeRequestWithURL:kApi_Myclass headers:kToken params:nil success:^(id json) {
        if ([json[@"result"] integerValue] == 1) {
            NSArray <MyTeachClass *>*classList = [MyTeachClass mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [classList enumerateObjectsUsingBlock:^(MyTeachClass * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.gradeArr addObject:obj.gradeName];
                [self.classArr addObject:[NSString stringWithFormat:@"%@班", obj.name]];
            }];
        } else {
            
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - initUI

- (void)initUI {
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick)];
    [leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"查询" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    self.tableView.frame = CGRectMake(0, kNaviHeight, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight-44);
    self.tableView.rowHeight = 44;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[CBFiltrateCell class] forCellReuseIdentifier:identifier];
    TableViewCellConfigureBlock block =  ^(CBFiltrateCell *cell, NSDictionary *item){
        cell.dict = item;
    };
    self.tableViewDataSource = [[TableViewDataSource alloc] initWithItems:self.allArrays cellIdentifier:identifier configureCellBlock:block];
    self.tableView.dataSource = self.tableViewDataSource;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    __weak __typeof(self) weakSelf = self;
    CBFiltrateCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        [self.view addSubview:self.gradePickView];
        self.gradePickView.num  = 2;
        self.gradePickView.oneRowArr = self.gradeArr;
        self.gradePickView.classArr = self.classArr;
        [self.gradePickView show];
        [self.gradePickView setGraClaClickBlock:^(NSString *title, NSInteger col, NSInteger row) {
            //            cell.option = title;
            cell.itemSubTitle = title;
            NSLog(@"%@",title);
            weakSelf.className = [NSString stringWithString:title];
        }];

    }else if (indexPath.row == 1){
        [self.view addSubview:self.dateTimeView];
        [self.dateTimeView show];
        [self.dateTimeView setChooseClickBlock:^(NSString *dateTime) {
            
            //            cell.option = dateTime;
            cell.itemSubTitle = dateTime;
            weakSelf.sDate = [NSString stringWithString:dateTime];
            NSLog(@"%@",dateTime);
        }];
    }else {
        [self.view addSubview:self.dateTimeView];
        [self.dateTimeView show];
        [self.dateTimeView setChooseClickBlock:^(NSString *dateTime) {
            
            //            cell.option = dateTime;
            cell.itemSubTitle = dateTime;
            weakSelf.eDate = [NSString stringWithString:dateTime];
            NSLog(@"%@",dateTime);
        }];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (void)loadData {
    self.gradeArr = [NSMutableArray arrayWithObjects:@"小学一年级",@"小学二年级",@"初中二年级",@"初中三年级",@"高中一年级",@"高中二年级",@"高中三年级", nil];
    self.classArr = [NSMutableArray arrayWithObjects:@"1班",@"2班",@"3班",@"4班",@"5班",@"6班",@"7班",@"8班",@"9班",@"10班", nil];
//    self.subjectArr = [NSMutableArray arrayWithObjects:@"语文",@"数学",@"英语",@"地理",@"历史",@"政治",@"美术",@"化学",@"物理", nil];
}

- (MyDateTimeView *)dateTimeView{
    if (!_dateTimeView) {
        _dateTimeView = [[MyDateTimeView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _dateTimeView;
}

- (CombancPickerView *)gradePickView{
    
    if (!_gradePickView) {
        _gradePickView = [[CombancPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _gradePickView;
}

@end
