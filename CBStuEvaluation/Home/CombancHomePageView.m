//
//  CombancHomePageView.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/11/6.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CombancHomePageView.h"
#import "CombancHomePageCell.h"

static NSString *cellID = @"CombancHomePageCell";

@interface CombancHomePageView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation CombancHomePageView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = RGBA(239, 239, 243, 1);
        self.pagingEnabled  = YES;
        [self registerClass:[CombancHomePageCell class] forCellWithReuseIdentifier:cellID];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CombancHomePageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.data = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *controllerName = self.data[indexPath.row][@"viewController"];
    UIViewController *viewController = [NSClassFromString(controllerName) new];
    viewController.title = self.data[indexPath.row][@"title"];
    [self.viewController.navigationController pushViewController:viewController animated:YES];
}

@end
