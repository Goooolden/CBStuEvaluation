//
//  CBClassRecordCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassRecordCell.h"

@interface CBClassRecordCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *centerLine;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation CBClassRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:self.bgView];
        self.bgView.layer.cornerRadius = radius;
        self.bgView.layer.masksToBounds = YES;
        [self.bgView addSubview:self.timeLabel];
        [self.bgView addSubview:self.centerLine];
        [self.bgView addSubview:self.detailLabel];
        
        [self initUI];
    }
    return self;
}

//- (void)setDict:(NSDictionary *)dict {
//    _dict = dict;
//    self.detailLabel.text = self.dict[@"text"];
//}

- (void)setItem:(RecordItem *)item {
    _item = item;
    self.timeLabel.text = item.createTime;
    self.detailLabel.text = [NSString stringWithFormat:@"%@",  item.course];
}

- (void)initUI {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(88);
    }];
    
    [self.centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(41);
        make.left.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.bgView).offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.centerLine);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.centerLine.mas_top);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.centerLine);
        make.top.equalTo(self.centerLine.mas_bottom);
        make.bottom.equalTo(self.bgView);
    }];
    
}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.text = @"2018-05-06 08:30";
    }
    return _timeLabel;
}

- (UIView *)centerLine {
    if (!_centerLine) {
        _centerLine = [[UIView alloc] init];
        _centerLine.backgroundColor = RGB16(0xd9d9d9);
    }
    return _centerLine;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:17];
        _detailLabel.textColor = [UIColor blackColor];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.text = @"初一1班 第1节 语文";
    }
    return _detailLabel;
}

@end
