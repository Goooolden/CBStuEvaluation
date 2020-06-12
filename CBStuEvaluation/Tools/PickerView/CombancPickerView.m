//
//  CombancPickerView.m
//  CombancClassAttendance
//
//  Created by Mac on 2018/9/26.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CombancPickerView.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface CombancPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    //左边退出按钮
    UIButton *cancelButton;
    //右边的确定按钮
    UIButton *chooseButton;
    
    NSString *graClaStr;
}

@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic,strong) NSArray *sectionArr;


@property (nonatomic,assign) NSInteger one;

@property (nonatomic,assign) NSInteger tow;



@end

@implementation CombancPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
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
    cancelButton.backgroundColor = [UIColor whiteColor];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelButton setTitleColor:UIColorFromRGB(0x0d8bf5) forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [upVeiw addSubview:cancelButton];
    
    //右边的确定按钮
    chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseButton.frame = CGRectMake(SCREEN_WIDTH - 52, 0, 40, 39);
    [chooseButton setTitle:@"确定" forState:UIControlStateNormal];
    chooseButton.backgroundColor = [UIColor whiteColor];
    chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [chooseButton setTitleColor:UIColorFromRGB(0x0d8bf5) forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(configButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [upVeiw addSubview:chooseButton];
    
    [view addSubview:upVeiw];
    [view addSubview:self.pickerView];
    
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
        self.chooseClickBlock(self.oneRowArr[self.one], self.one);
    }
    if (self.graClaClickBlock) {
        self.graClaClickBlock([NSString stringWithFormat:@"%@%@",self.oneRowArr[self.one],self.classArr[self.tow]], self.one, self.tow);
    }
    [self dissmiss];
    
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.num;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.oneRowArr.count;
    }else{
        return self.classArr.count;
    }
    
}

#pragma -mark UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 35;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return SCREEN_WIDTH / self.num - 32;
}

/** The custom view */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    [[pickerView.subviews objectAtIndex:1] setHidden:TRUE];
    [[pickerView.subviews objectAtIndex:2] setHidden:TRUE];
    NSString *text;
    if (component == 0) {

        text = self.oneRowArr[row];

    }else{
        text = self.classArr[row];
    }
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:25.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = text;
    return titleLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        self.one = row;
    }else{
        self.tow = row;
    }
}


@end
