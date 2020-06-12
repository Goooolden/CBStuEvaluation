//
//  CBEvaTableView.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/1.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBEvaTableView.h"
#import "CBEvlDefaultCell.h"
#import "CBEvlStyleValue1Cell.h"
#import "TableViewSectionObject.h"
#import "TableViewBaseItem.h"
#import "CBHeaderView.h"
#import "CBFooterView.h"

#import "CBTextViewCell.h"
#import "SelectPictureView.h"

#import "CBListEvenModel.h"

#import "CBClassElvQuiryController.h"

static NSString * const kCBEvlDefaultCell = @"CBEvlDefaultCell";
static NSString * const kCBEvlStyleValue1Cell = @"CBEvlStyleValue1Cell";

@interface CBEvaTableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation CBEvaTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self registerClass:[CBEvlDefaultCell class] forCellReuseIdentifier:kCBEvlDefaultCell];
        [self registerClass:[CBEvlStyleValue1Cell class] forCellReuseIdentifier:kCBEvlStyleValue1Cell];
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = 44;
        self.tableFooterView = [self tableFooterView];
        
        [self loadListEvent];
    }
    return self;
}

- (void)loadListEvent {
    [BaseHandler executeRequestWithURL:kApi_ListEventByCourse headers:kToken params:@{@"courseId": @"6275"} success:^(id json) {
        
        if ([json[@"result"] integerValue] == 1) {
            NSArray <CBListEvenModel *> *array = [CBListEvenModel mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
            
            TableViewSectionObject *section = self.sections[0];
            
            TableViewBaseItem *item = section.items[0];
            
            NSMutableString *event = [NSMutableString new];
            
            [array enumerateObjectsUsingBlock:^(CBListEvenModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [event appendString:obj.name];
                if (idx != array.count - 1) {
                    [event appendString:@"/"];
                }
            }];
            
            item.itemTitle = event;
            
            [self reloadData];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

- (Class)tableView:(UITableView *)tableView cellClassForObject:(TableViewBaseItem *)object {
    return [UITableViewCell class];
}

#pragma mark - TableViewDataSource
- (TableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections.count > indexPath.section) {
        TableViewSectionObject *sectionObject = self.sections[indexPath.section];
        return sectionObject.items[indexPath.row];
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.sections.count > section) {
        TableViewSectionObject *sectionObject = self.sections[section];
        return sectionObject.items.count;
    }
    return 0;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        CBClassElvQuiryController *vc = [[CBClassElvQuiryController alloc] initWithTitle:@"选择学员"];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CBHeaderView *headerView = [[CBHeaderView alloc] init];
    if (self.sections.count > section) {
        TableViewSectionObject *sectionObject = [self.sections objectAtIndex:section];
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
    
    CGFloat picheight = (SCREEN_WIDTH - 32 - 11 *2)/3;
    SelectPictureView *selectPicView = [[SelectPictureView alloc] initWithMaxWidth:SCREEN_WIDTH];
    selectPicView.backgroundColor = UIColor.whiteColor;
    selectPicView.maxPhotoNum = 9;
    [footerView addSubview:selectPicView];
    [selectPicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(footerView);
        make.top.equalTo(textView.mas_bottom).offset(16);
//        make.height.offset((self.selectedAssets.count > 3)?picheight*2+MARGIN:picheight+MARGIN);
        make.height.mas_equalTo(picheight);
    }];
    
    headerHeight += picheight + 16;
    
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
        [weakSelf beginUpdates];
        [weakSelf setTableHeaderView: weakSelf.tableHeaderView];
        [weakSelf endUpdates];
    };
    
    footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headerHeight);
    return footerView;
}


@end
