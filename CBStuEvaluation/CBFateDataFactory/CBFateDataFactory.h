//
//  CBFateDataFactory.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/23.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBFateDataFactory : NSObject

+ (NSArray *)groupDetailDataSource;/*分组的详情*/
+ (NSArray *)groupListDataSource;/*分组管理列表*/
+ (NSArray *)classRecordDataSource;/*课堂纪律列表*/
+ (NSArray *)classFiltrateDataSource;
+ (NSArray *)evlDataSource;

+ (NSArray *)classTimeDataSource;

+ (NSMutableArray *)showElvData;
+ (NSMutableArray *)fillElvData;


@end

NS_ASSUME_NONNULL_END
