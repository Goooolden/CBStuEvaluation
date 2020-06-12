//
//  CBFateDataFactory.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/23.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBFateDataFactory.h"
#import "TableViewSectionObject.h"
#import "TableViewBaseItem.h"

@implementation CBFateDataFactory

#pragma mark - 分组管理
//分组的详情
+ (NSArray *)groupDetailDataSource {
    NSMutableArray *section0 = [[NSMutableArray alloc] init];
    [section0 addObject:@{
                          @"text": @"班级",
                          @"detailText": @"高一1班"
                          }];
    [section0 addObject:@{
                          @"text": @"名称",
                          @"detailText": @"数学兴趣组"
                          }];
    [section0 addObject:@{
                          @"text": @"分组个数",
                          @"detailText": @"10个"
                          }];
    NSMutableArray *section1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 8; i++) {
        [section1 addObject:@{
                              @"text": [NSString stringWithFormat:@"第%d组", i+1],
                              @"detailText": @"10人"
                              }];
    }
    return @[section0.copy, section1.copy];
}

//分组管理列表
+ (NSArray *)groupListDataSource {
    NSMutableArray *section0 = [NSMutableArray array];
    for (int i = 0; i < 200; i++) {
        [section0 addObject:@{
                              @"text": [NSString stringWithFormat:@"一年级%d班", i+1],
                              @"detailText": @"默认"
                              }];
    }
    return section0.copy;
}

//分组管理列表
+ (NSArray *)classRecordDataSource {
    NSMutableArray *section0 = [NSMutableArray array];
    for (int i = 0; i < 200; i++) {
        [section0 addObject:@[@{
                              @"text": [NSString stringWithFormat:@"一年级%d班", i+1],
                              @"detailText": @"默认"
                              }]];
    }
    return section0.copy;
}

+ (NSArray *)classTimeDataSource {
    NSArray *array = @[@{
                           @"text": @"班级",
                           @"detailText": @"请选择"
                           },
                       @{
                           @"text": @"开始时间",
                           @"detailText": @"请选择"
                           },
                       @{
                           @"text": @"结束时间",
                           @"detailText": @"请选择"
                           }];
    return array;
}
//
//+ (NSArray *)evlDataSource {
//    NSArray *array = @[
//                           @[@{
//                                 @"headerTitle": @"评价类型",
//                                 @"item":@[@{@"text": @"评学生"}]
//                                 }
//                               ],
//                           @[@{
//                                 @"headerTitle": @"指标项",
//                                 @"item":@[@{@"text": @"学习/j纪律"}]
//                                 }
//                               ],
//                           @[@{
//                                 @"headerTitle": @"人员",
//                                 @"item":@[@{@"text": @"张晓波，李玉"}]
//                                 }
//                               ],
//
//                           @[@{
//                                 @"headerTitle": @"加分项目",
//                                 @"item":@[@{@"text": @"某某加分项目"},
//                                           @{@"text": @"某某加分项目"},
//                                           @{@"text": @"某某加分项目"}]
//                                 }
//                               ]
//                           ];
//    return array;
//}

+ (NSArray *)classFiltrateDataSource {
    NSArray *array = @[@{
                           @"text": @"日期",
                           @"detailText": @"请选择"
                           },
                       @{
                           @"text": @"课堂",
                           @"detailText": @"请选择"
                           },
//                       @{
//                           @"text": @"班级",
//                           @"detailText": @"请选择"
//                           },
//                       @{
//                           @"text": @"科目",
//                           @"detailText": @"请选择"
//                           }
                       ];
    return array;
}

+ (NSArray *)evlDataSource {
    NSArray *array = @[
                       @[@{@"text": @"评学生"}],
                       @[@{@"text": @"学习/纪律"}],
                       @[@{@"text": @"张晓波，李玉", @"accessoryImage": @"per_add"}],
                       @[@{@"image": @"project_checkmark_choose", @"text": @"某某加分项目"},
                            @{@"image": @"project_checkmark_default", @"text": @"某某加分项目"},
                            @{@"image": @"project_checkmark_default", @"text": @"某某加分项目"}]
                       ];
    return array;
}


+ (NSMutableArray *)fillElvData {
    TableViewBaseItem *item0 = [[TableViewBaseItem alloc] initWithImage:nil title:@"请选择" subTitle:nil accessoryImage:@"target_row"];
    TableViewSectionObject *sec0 = [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item0, nil]];
    sec0.headerTitle = @"指标项";
    
    TableViewBaseItem *item1 = [[TableViewBaseItem alloc] initWithImage:nil title:@"请选择" subTitle:nil accessoryImage:@"per_add"];
    TableViewSectionObject *sec1 = [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item1, nil]];
    sec1.headerTitle = @"人员";
    
    TableViewBaseItem *item20 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_choose" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewBaseItem *item21 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_default" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewBaseItem *item22 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_default" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewSectionObject *sec12= [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item20, item21, item22, nil]];
    sec12.headerTitle = @"加减分项目";
    
    return [NSMutableArray arrayWithObjects:sec0, sec1, sec12, nil];
}

+ (NSMutableArray *)showElvData {
    TableViewBaseItem *item0 = [[TableViewBaseItem alloc] initWithImage:nil title:@"学生" subTitle:nil accessoryImage:@"target_row"];
    TableViewSectionObject *sec0 = [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item0, nil]];
    sec0.headerTitle = @"评价类型";
    
    TableViewBaseItem *item1 = [[TableViewBaseItem alloc] initWithImage:nil title:@"学习/纪律" subTitle:nil accessoryImage:@"target_row"];
    TableViewSectionObject *sec1 = [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item1, nil]];
    sec1.headerTitle = @"指标项";
    
    TableViewBaseItem *item2 = [[TableViewBaseItem alloc] initWithImage:nil title:@"张晓波、李玉" subTitle:nil accessoryImage:@"per_add"];
    TableViewSectionObject *sec2 = [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item2, nil]];
    sec2.headerTitle = @"人员";
    
    TableViewBaseItem *item30 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_choose" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewBaseItem *item31 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_default" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewBaseItem *item32 = [[TableViewBaseItem alloc] initWithImage:@"project_checkmark_default" title:@"某某项目+5分" subTitle:nil accessoryImage:nil];
    TableViewSectionObject *sec3= [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item30, item31, item32, nil]];
    sec3.headerTitle = @"加减分项目";
    
//    TableViewBaseItem *item40 = [[TableViewBaseItem alloc] initWithImage:nil title:@"详细描述" subTitle:nil accessoryImage:nil];
//        TableViewSectionObject *sec4= [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item40, nil]];
//
//    TableViewBaseItem *item50 = [[TableViewBaseItem alloc] initWithImage:nil title:@"图片" subTitle:nil accessoryImage:nil];
//    TableViewSectionObject *sec5= [[TableViewSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:item50, nil]];
    
    return [NSMutableArray arrayWithObjects:sec0, sec1, sec2, sec3, nil];
}

@end
