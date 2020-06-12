//
//  CBFiltrateController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBFiltrateController.h"
#import "CBFiltrateCell.h"
#import "CombancPickerView.h"
#import "MyDateTimeView.h"
#import "CBFateDataFactory.h"
#import "CBClassRecordList.h"
#import "CBFillInClassEvlController.h"

static NSString *identifier = @"CBFiltrateCell";

@interface CBFiltrateController ()

@property (nonatomic, strong) NSMutableArray *allArrays;
//@property (nonatomic, strong) NSMutableArray *gradeArr;
@property (nonatomic, strong) NSMutableArray *classArr;
@property (nonatomic, strong) NSMutableArray *subjectArr;

//@property (nonatomic, strong) NSMutableArray *<#name#>;

//@property (nonatomic, strong) CombancPickerView *gradePickView;
@property (nonatomic, strong) CombancPickerView *subjectPickView;
@property (nonatomic, strong) MyDateTimeView *dateTimeView;

@property (nonatomic, copy) NSString *sDate;
@property (nonatomic, copy) NSString *eDate;


@property (nonatomic, copy) NSString *startDate;

@property (nonatomic, copy) NSString *courseId;

@end

@implementation CBFiltrateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.title stringByAppendingString:@"(1/2)"];
    
    self.allArrays = [NSMutableArray arrayWithArray:[CBFateDataFactory classFiltrateDataSource]];
    
    [self initUI];
//    [self loadData];
}

- (void)rightBarButtonClick {
    CBFillInClassEvlController *fillInClassEvlVC = [[CBFillInClassEvlController alloc] initWithTitle:@"课堂评价(2/2)"];
    fillInClassEvlVC.courseId = self.courseId;
    [self.navigationController pushViewController:fillInClassEvlVC animated:YES];
}

#pragma mark - initUI

- (void)initUI {
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [barItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = barItem;
    
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
        [self.view addSubview:self.dateTimeView];
        [self.dateTimeView show];
        [self.dateTimeView setChooseClickBlock:^(NSString *dateTime) {
            cell.itemSubTitle = dateTime;
            weakSelf.startDate = [NSString stringWithString:dateTime];
            weakSelf.sDate = dateTime;
            weakSelf.eDate = dateTime;
            [weakSelf loadData];
//            cell.option = dateTime;
            NSLog(@"%@",dateTime);
        }];
    }else if (indexPath.row == 1){
        if (self.classArr.count == 0) {
            return;
        }
        [self.view addSubview:self.subjectPickView];
        self.subjectPickView.num  = 1;
        self.subjectPickView.oneRowArr = self.classArr;
        [self.subjectPickView show];
        [self.subjectPickView setChooseClickBlock:^(NSString *title, NSInteger row) {
            //            cell.option = title;
            cell.itemSubTitle = title;
            
            MyTeachClass *myClass = weakSelf.subjectArr[row];
            weakSelf.courseId = myClass.itemId;
            NSLog(@"%@",title);
        }];
    }
//    else if (indexPath.row == 2){
//        [self.view addSubview:self.gradePickView];
//        self.gradePickView.num  = 2;
//        self.gradePickView.oneRowArr = self.gradeArr;
//        self.gradePickView.classArr = self.classArr;
//        [self.gradePickView show];
//        [self.gradePickView setGraClaClickBlock:^(NSString *title) {
//            cell.itemSubTitle = title;
//            //            cell.option = title;
//            NSLog(@"%@",title);
//        }];
//    }else{
//        [self.view addSubview:self.subjectPickView];
//        self.subjectPickView.num  = 1;
//        self.subjectPickView.oneRowArr = self.subjectArr;
//        [self.subjectPickView show];
//        [self.subjectPickView setChooseClickBlock:^(NSString *title) {
//            cell.itemSubTitle = title;
//            //            cell.option = title;
//            NSLog(@"%@",title);
//        }];
//    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, SCREEN_WIDTH-10, 44)];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor grayColor];
    label.text = @"课程信息";
    [view addSubview:label];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (void)loadData {
    

    if (self.sDate.length == 0 && self.eDate.length == 0) {
        return;
    }
    
    self.classArr = [NSMutableArray array];
    
    self.subjectArr = [NSMutableArray array];
    
    [BaseHandler executeRequestWithURL:kApi_MyCourse headers:kToken params:@{@"sdate": self.sDate, @"edate": self.eDate} success:^(id json) {
        if ([json[@"result"] integerValue] == 1) {
            NSArray <MyTeachClass *>*classList = [MyTeachClass mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [classList enumerateObjectsUsingBlock:^(MyTeachClass * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.classArr addObject:[NSString stringWithFormat:@"%@班第%@节%@", obj.clazz, obj.numofday, obj.subject]];
                [self.subjectArr addObject: obj];
            }];
        } else {
            
        }
    } failure:^(NSError *error) {
        
    }];
    
    
    
//    self.gradeArr = [NSMutableArray arrayWithObjects:@"小学一年级",@"小学二年级",@"初中二年级",@"初中三年级",@"高中一年级",@"高中二年级",@"高中三年级", nil];
//    self.classArr = [NSMutableArray arrayWithObjects:@"1班",@"2班",@"3班",@"4班",@"5班",@"6班",@"7班",@"8班",@"9班",@"10班", nil];
//    self.subjectArr = [NSMutableArray arrayWithObjects:@"语文",@"数学",@"英语",@"地理",@"历史",@"政治",@"美术",@"化学",@"物理", nil];
}

- (MyDateTimeView *)dateTimeView{
    if (!_dateTimeView) {
        _dateTimeView = [[MyDateTimeView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _dateTimeView;
}

//- (CombancPickerView *)gradePickView{
//
//    if (!_gradePickView) {
//        _gradePickView = [[CombancPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    }
//    return _gradePickView;
//}

- (CombancPickerView *)subjectPickView{
    
    if (!_subjectPickView) {
        _subjectPickView = [[CombancPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _subjectPickView;
}

@end
