//
//  CBTextViewCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/19.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBTextViewCell.h"
#import "UITextView+SEPlaceholder.h"

@interface CBTextViewCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *limitLab;

@end

@implementation CBTextViewCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self initUI];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.text = @"详细描述";
    self.titleLab.font = MediumFont(15);
    self.titleLab.textColor = RGBA(56, 56, 61, 1);
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.titleLab];
    
    self.textView = [[UITextView alloc] init];
    self.textView.placeholder = @"请输入内容";
    self.textView.font = MediumFont(14);
    self.textView.textColor = RGB16(0x38383d);
    [self addSubview:self.textView];
    
    self.limitLab = [[UILabel alloc] init];
    self.limitLab.text = @"最多输入50个字符";
    self.limitLab.font = MediumFont(14);
    self.limitLab.textColor = RGBA(199, 199, 204, 1);;
    self.limitLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.limitLab];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.top.equalTo(self).offset(5);
    }];
    

    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-16);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.bottom.equalTo(self).mas_equalTo(-30);
    }];
    
    [self.limitLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.textView.mas_bottom);
        make.right.equalTo(self).offset(-16);
        make.bottom.equalTo(self).offset(-15);
    }];
}


@end
