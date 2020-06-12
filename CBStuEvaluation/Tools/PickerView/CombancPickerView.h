//
//  CombancPickerView.h
//  CombancClassAttendance
//
//  Created by Mac on 2018/9/26.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CombancPickerView : UIView

@property (nonatomic,strong) NSMutableArray *oneRowArr;

@property (nonatomic,strong) NSArray *classArr;

@property (nonatomic,assign) NSInteger num;

@property (nonatomic, copy) void (^chooseClickBlock)(NSString *title, NSInteger row);

@property (nonatomic, copy) void (^graClaClickBlock)(NSString *title, NSInteger col, NSInteger row);

- (void)show;

- (void)dissmiss;


@end
