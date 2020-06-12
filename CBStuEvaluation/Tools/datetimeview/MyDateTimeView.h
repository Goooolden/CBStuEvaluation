//
//  MyDateTimeView.h
//  DateTimePickerViewDemo
//
//  Created by hniisoft on 2018/9/11.
//  Copyright © 2018年 TZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDateTimeView : UIView

@property (nonatomic, copy) void (^chooseClickBlock)(NSString *dateTime);


- (void)show;

- (void)dissmiss;

@end
