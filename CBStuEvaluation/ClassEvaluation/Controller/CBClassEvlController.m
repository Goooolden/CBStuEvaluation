//
//  CBClassEvlController.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassEvlController.h"
#import "CombancHomePageView.h"

@interface CBClassEvlController ()

@property (nonatomic, strong) CombancHomePageView *collectionView;
@property (nonatomic, copy) NSArray *data;

@end

@implementation CBClassEvlController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - lazyMethod

- (CombancHomePageView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumInteritemSpacing = 13;
        flowLayout.minimumLineSpacing = 13;
        CGFloat itemWidth = (SCREEN_WIDTH-56)/3;
        CGFloat itemHeight = itemWidth * 120 /105;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
        _collectionView = [[CombancHomePageView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsMake(48, 15, 0, 15);
        _collectionView.data = self.data;
        if (@available(iOS 10.0, *)) {
            _collectionView.prefetchingEnabled = NO;
        }
    }
    return _collectionView;
}


- (NSArray *)data {
    if (!_data) {
        _data = @[
                      @{
                          @"title": @"课堂评价",
                          @"imageName": @"icon_classEvaluate",
                          @"viewController": @"CBFiltrateController"
                          },
                      @{
                          @"title": @"课堂记录",
                          @"imageName": @"icon_classRecord",
                          @"viewController": @"CBClassRecordListController"
                          },
                      @{
                          @"title": @"课堂统计",
                          @"imageName": @"icon_classStatistics",
                          @"viewController": @"BaseController"
                          },
                      ];
    }
    return _data;
}

@end
