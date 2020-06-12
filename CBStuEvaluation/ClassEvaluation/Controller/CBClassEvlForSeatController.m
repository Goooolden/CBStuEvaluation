//
//  CBClassEvlForSeatController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassEvlForSeatController.h"
#import "CustomUICollectionViewLayout.h"
#import "CBSeatCell.h"

#import "ListGroupUsers.h"

static NSString *collectionCellID = @"parCollectionCellID";


@interface CBClassEvlForSeatController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, assign) NSInteger cols;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSArray *rawArray;

@end

@implementation CBClassEvlForSeatController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.collectionView];
//    [self loadData];
}

- (void)loadData {
    __weak __typeof(self) weakSelf = self;
    self.dataArray = [NSMutableArray array];
    
    
    
    [GCDQueue executeInGlobalQueue:^{

        [BaseHandler executeRequestWithURL:kApi_ListTypeByCourse headers:kToken params:@{} success:^(id json) {
            if ([json[@"result"] integerValue] == 1) {
                [BaseHandler executeRequestWithURL:kApi_SeatDetail headers:kToken params:@{@"seatId": @"5"} success:^(id json) {
                    if ([json[@"result"] integerValue] == 1) {
                        self.rawArray = [User mj_objectArrayWithKeyValuesArray:json[@"data"]];
                        NSInteger cols = 0;
                        if (self.rawArray.count%self.rows == 0) {
                            cols = (NSInteger)self.rawArray.count/self.rows;
                        } else {
                            cols = (NSInteger)self.rawArray.count/self.rows + 1;
                        }
                        for (NSInteger col = 0; col<cols; col++) {
                            NSMutableArray *colsArray = [NSMutableArray array];
                            for (int row = 0; row < self.rows; row ++) {
                                if (col * self.rows + row >= weakSelf.rawArray.count) {
                                    break;
                                }
                                [colsArray addObject:weakSelf.rawArray[col * self.rows + row]];
                            }
                            [self.dataArray addObject:colsArray];
                        }
                    } else {
                        
                    }
                    
                    [GCDQueue executeInMainQueue:^{
                        [weakSelf.view addSubview:self.collectionView];
                        [weakSelf.collectionView reloadData];
                    }];
                    
                } failure:^(NSError *error) {
                    
                }];
            }
        } failure:^(NSError *error) {
            
        }];
        
    }];
}

#pragma mark - UICollectionViewDataSource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    CBSeatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
//    cell.index = indexPath.section * 8 + indexPath.row + 1;
//    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
//    selectedBackgroundView.backgroundColor = [UIColor blueColor];
//    cell.selectedBackgroundView = selectedBackgroundView;
//    return cell;
    CBSeatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    //    cell.index = indexPath.section * self.rows + indexPath.row + 1;
    NSInteger count = indexPath.section * self.rows + indexPath.row;
    if (count < self.rawArray.count) {
        cell.user = self.dataArray[indexPath.section][indexPath.row];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rows;
}

#pragma mark - UICollectionViewDelegate

//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    //设置(Highlight)高亮下的颜色
    [cell.contentView setBackgroundColor:[UIColor blueColor]];
}

- (void)collectionView:(UICollectionView *)collectionView  didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    //设置(Nomal)正常状态下的颜色
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
}

//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    CBSeatCell *cell = (CBSeatCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.selectedBackgroundView.backgroundColor = [UIColor blueColor];
//    //选中之后的cell变颜色
////    [self updateCellStatus:cell selected:YES];
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    CBSeatCell *cell = (CBSeatCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.selectedBackgroundView.backgroundColor = [UIColor redColor];
////    [self updateCellStatus:cell selected:NO];
//}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    CBSeatCell *cell = (CBSeatCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.selectedBackgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    //选中之后的cell变颜色
//    [self updateCellStatus:cell selected:YES];
//}

//取消选中操作
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CBSeatCell *cell = (CBSeatCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [self updateCellStatus:cell selected:NO];
//}
// 改变cell的背景颜色
//-(void)updateCellStatus:(CBSeatCell *)cell selected:(BOOL)selected {
//    cell.selectedBackgroundView.backgroundColor = selected ? [UIColor blueColor]:[UIColor whiteColor];
//
////    cell.layer.borderWidth = selected ? 0:1.0;
//}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CustomUICollectionViewLayout *flowLayout = [[CustomUICollectionViewLayout alloc] initWithNumberOfRows: self.rows];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 4, SCREEN_WIDTH, SCREEN_HEIGHT-kNaviHeight-44-4) collectionViewLayout:flowLayout];
        _collectionView.directionalLockEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = RGBA(239, 239, 243, 1);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.allowsMultipleSelection = YES;
        [_collectionView registerClass:[CBSeatCell class] forCellWithReuseIdentifier:collectionCellID];
        if (@available(iOS 10.0, *)) {
            _collectionView.prefetchingEnabled = NO;
        }
    }
    return _collectionView;
}

@end
