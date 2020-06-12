//
//  MyDateTimeView.m
//  DateTimePickerViewDemo
//
//  Created by hniisoft on 2018/9/11.
//  Copyright © 2018年 TZF. All rights reserved.
//

#import "MyDateTimeView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 获取RGB颜色
//#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

@interface MyDateTimeView()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSInteger yearRange;
    NSInteger dayRange;
    NSInteger startYear;
    NSInteger selectedYear;
    NSInteger selectedMonth;
    NSInteger selectedDay;
    NSInteger selectedHour;
    NSInteger selectedMinute;
    NSInteger selectedSecond;
    
    //左边退出按钮
    UIButton *cancelButton;
    //右边的确定按钮
    UIButton *chooseButton;
}

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSString *string;


@end
@implementation MyDateTimeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickbackgroundView)];
        [self addGestureRecognizer:tapges];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 300, SCREEN_WIDTH, 300)];
        [self addSubview:view];
        self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 260)];
        self.pickerView.backgroundColor = [UIColor whiteColor];
        self.pickerView.dataSource=self;
        self.pickerView.delegate=self;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 39, SCREEN_WIDTH, 1)];
        line.backgroundColor = RGBA(239, 239, 243, 1);
        //盛放按钮的View
        UIView *upVeiw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        upVeiw.backgroundColor = [UIColor whiteColor];
        [upVeiw addSubview:line];

        //左边的取消按钮
        cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(12, 0, 40, 39);
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.backgroundColor = [UIColor clearColor];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [cancelButton setTitleColor:UIColorFromRGB(0x0d8bf5) forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [upVeiw addSubview:cancelButton];
        
        //右边的确定按钮
        chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseButton.frame = CGRectMake(SCREEN_WIDTH - 52, 0, 40, 39);
        [chooseButton setTitle:@"确定" forState:UIControlStateNormal];
        chooseButton.backgroundColor = [UIColor clearColor];
        chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [chooseButton setTitleColor:UIColorFromRGB(0x0d8bf5) forState:UIControlStateNormal];
        [chooseButton addTarget:self action:@selector(configButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [upVeiw addSubview:chooseButton];
        
        
        NSCalendar *calendar0 = [NSCalendar currentCalendar];
        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDateComponents *comps  = [calendar0 components:unitFlags fromDate:[NSDate date]];
        NSInteger year=[comps year];
        
        startYear=year-100;
        yearRange=200;
        [self setCurrentDate:[NSDate date]];
        [view addSubview:upVeiw];
        [view addSubview:self.pickerView];
       
    }
    return self;
}

- (void)clickbackgroundView{
    [self dissmiss];
}

- (void)show {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}

- (void)dissmiss{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
   
}


- (void)cancelButtonClick{
    
    [self dissmiss];
}

- (void)configButtonClick{
    if (self.chooseClickBlock) {
        self.chooseClickBlock(_string);
    }
    [self dissmiss];
    
}

//默认时间的处理
-(void)setCurrentDate:(NSDate *)currentDate
{
    //获取当前时间
    NSCalendar *calendar0 = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps  = [calendar0 components:unitFlags fromDate:[NSDate date]];
    
    NSInteger year=[comps year];
    NSInteger month=[comps month];
    NSInteger day=[comps day];
    NSInteger hour=[comps hour];
    NSInteger minute=[comps minute];
    NSInteger second=[comps second];
    
    selectedYear=year;
    selectedMonth=month;
    selectedDay=day;
    selectedHour=hour;
    selectedMinute=minute;
    selectedSecond =second;
    
    dayRange=[self isAllDay:year andMonth:month];
    
    [self.pickerView selectRow:year-startYear inComponent:0 animated:NO];
    [self.pickerView selectRow:month-1 inComponent:1 animated:NO];
    [self.pickerView selectRow:day-1 inComponent:2 animated:NO];
   
    
    [self pickerView:self.pickerView didSelectRow:year-startYear inComponent:0];
    [self pickerView:self.pickerView didSelectRow:month-1 inComponent:1];
    [self pickerView:self.pickerView didSelectRow:day-1 inComponent:2];
   

    
    [self.pickerView reloadAllComponents];
}

#pragma mark - 选择对应月份的天数
-(NSInteger)isAllDay:(NSInteger)year andMonth:(NSInteger)month
{
    int day=0;
    switch(month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            day=31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            day=30;
            break;
        case 2:
        {
            if(((year%4==0)&&(year%100!=0))||(year%400==0))
            {
                day=29;
                break;
            }
            else
            {
                day=28;
                break;
            }
        }
        default:
            break;
    }
    return day;
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

//确定每一列返回的东西
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
        switch (component) {
            case 0:
            {
                return yearRange;
            }
                break;
            case 1:
            {
                return 12;
            }
                break;
            case 2:
            {
                return dayRange;
            }
                break;
            default:
                break;
        }
    
  
    return 0;
}

#pragma mark -- UIPickerViewDelegate

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    [[pickerView.subviews objectAtIndex:1] setHidden:TRUE];
    [[pickerView.subviews objectAtIndex:2] setHidden:TRUE];
    UILabel*label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:25.0];
    label.textAlignment=NSTextAlignmentCenter;
   

    switch (component) {
        case 0:
        {
            label.text=[NSString stringWithFormat:@"%ld年",(long)(startYear + row)];
        }
            break;
        case 1:
        {
            label.text=[NSString stringWithFormat:@"%ld月",(long)row+1];
        }
            break;
        case 2:
        {
            
            label.text=[NSString stringWithFormat:@"%ld日",(long)row+1];
        }
            break;

        default:
            break;
    }

    
    return label;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
   return (SCREEN_WIDTH-40)/3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30;
}
// 监听picker的滑动
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
        switch (component) {
            case 0:
            {
                selectedYear=startYear + row;
                dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
                [self.pickerView reloadComponent:2];
            }
                break;
            case 1:
            {
                selectedMonth=row+1;
                dayRange=[self isAllDay:selectedYear andMonth:selectedMonth];
                [self.pickerView reloadComponent:2];
            }
                break;
            case 2:
            {
                selectedDay=row+1;
            }
                break;
          
            default:
                break;
        }
        
        _string =[NSString stringWithFormat:@"%ld/%.2ld/%.2ld",selectedYear,selectedMonth,selectedDay];
}
@end
