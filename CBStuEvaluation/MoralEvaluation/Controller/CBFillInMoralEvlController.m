//
//  CBFillInMoralEvlController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/31.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBFillInMoralEvlController.h"
#import "TableViewSectionObject.h"
#import "TableViewBaseItem.h"
#import "CBEvlDefaultCell.h"
#import "CBEvlStyleValue1Cell.h"
#import "CBHeaderView.h"
#import "CBFooterView.h"

#import "CBTextViewCell.h"
#import "SelectPictureView.h"
#import "CBListEvenModel.h"

#import "CBClassElvQuiryController.h"

#import "CBFateDataFactory.h"

static NSString * const kCBEvlDefaultCell = @"CBEvlDefaultCell";
static NSString * const kCBEvlStyleValue1Cell = @"CBEvlStyleValue1Cell";

@interface CBFillInMoralEvlController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *sectionArray;


@end

@implementation CBFillInMoralEvlController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    self.sectionArray = [CBFateDataFactory showElvData];
    [self.view addSubview:self.tableView];
}

- (void)leftBarButtonClick {
    [self .navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClick {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableViewSectionObject *sectionObject = self.sectionArray[section];
    return sectionObject.items.count;
}

- (TableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sectionArray.count > indexPath.section) {
        TableViewSectionObject *sectionObject = self.sectionArray[indexPath.section];
        return sectionObject.items[indexPath.row];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewBaseItem *item = [self tableView:tableView objectForRowAtIndexPath:indexPath];
    if (item.itemImage) {
        CBEvlStyleValue1Cell *cell = [[CBEvlStyleValue1Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCBEvlStyleValue1Cell];
        cell.item = item;
        return cell;
    } else {
        CBEvlDefaultCell *cell = [[CBEvlDefaultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCBEvlDefaultCell];
        cell.item = item;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        CBClassElvQuiryController *vc = [[CBClassElvQuiryController alloc] initWithTitle:@"选择学员"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CBHeaderView *headerView = [[CBHeaderView alloc] init];
    if (self.sectionArray.count > section) {
        TableViewSectionObject *sectionObject = [self.sectionArray objectAtIndex:section];
        headerView.title = sectionObject.headerTitle;
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableFooterView {
    CGFloat headerHeight = 14;
    
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    CBTextViewCell *textView = [[CBTextViewCell alloc] init];
    [footerView addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footerView);
        make.top.equalTo(footerView).offset(14);
        make.height.mas_equalTo(120);
    }];
    
    headerHeight += 120+14;
    
    CGFloat picheight = (SCREEN_WIDTH - 32 - 10 *2)/3;
    SelectPictureView *selectPicView = [[SelectPictureView alloc] initWithMaxWidth:SCREEN_WIDTH];
    selectPicView.backgroundColor = UIColor.whiteColor;
    selectPicView.maxPhotoNum = 9;
    selectPicView.maxLineNum = 3;
    [footerView addSubview:selectPicView];
    [selectPicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footerView);
        make.top.equalTo(textView.mas_bottom).offset(16);
        //        make.height.offset((self.selectedAssets.count > 3)?picheight*2+MARGIN:picheight+MARGIN);
        make.height.mas_equalTo((picheight + 10) * 3 + 40);
    }];
    
    headerHeight += (picheight + 10) * 3 + 40 + 16;
    
    //  选中的图片
    __weak __typeof__(self) weakSelf = self;
    __weak __typeof__(SelectPictureView*) weakselectPicView = selectPicView;
    selectPicView.FinishPickingPhotosHandle = ^(NSArray<UIImage*>*photos){
        //        weakSelf.images = photos;
        //        __block CGFloat picViewHeight = 0;
        //        [weakselectPicView mas_updateConstraints:^(MASConstraintMaker *make) {
        //            if (photos.count > 3) {
        //                make.height.offset((picheight+MARGIN)*2);
        //                picViewHeight = (picheight+MARGIN)*2;
        //            }else{
        //                make.height.offset((picheight+MARGIN));
        //                picViewHeight = picheight+MARGIN;
        //            }
        //        }];
        //        CGRect newFrame = weakSelf.tableHeaderView.frame;
        //        newFrame.size.height = newFrame.size.height - weakselectPicView.height + picViewHeight;
        //        if (weakSelf.tableHeaderView.frame.size.height == newFrame.size.height) {
        //            return;
        //        }
        //        weakSelf.frame = newFrame;
        
        //#mark Todo
        //        [weakSelf beginUpdates];
        //        [weakSelf setTableHeaderView: weakSelf.tableHeaderView];
        //        [weakSelf endUpdates];
    };
    
    footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headerHeight);
    return footerView;
}

#pragma mark - lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[CBEvlDefaultCell class] forCellReuseIdentifier:kCBEvlDefaultCell];
        [_tableView registerClass:[CBEvlStyleValue1Cell class] forCellReuseIdentifier:kCBEvlStyleValue1Cell];
        _tableView.rowHeight = 44;
        _tableView.tableFooterView = [self tableFooterView];
    }
    return _tableView;
}

- (void)initUI {

    self.title = @"添加评价";
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick)];
    [leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
//    [barItem setTintColor:[UIColor whiteColor]];
//    self.navigationItem.rightBarButtonItem = barItem;
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

//- (CBEvaTableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[CBEvaTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    }
//    return _tableView;
//}

@end
