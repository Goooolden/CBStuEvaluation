//
//  CombancHomePageCell.m
//  CombancClassAttendance
//
//  Created by Mac on 2018/9/18.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CombancHomePageCell.h"

@interface CombancHomePageCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CombancHomePageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    self.imageView.image = [UIImage imageNamed:data[@"imageName"]];
    self.titleLabel.text = data[@"title"];
}

- (void)initUI {
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = UIColor.whiteColor;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = MediumFont(16);
    self.titleLabel.textColor = RGBA(56, 56, 61, 1);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(22);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
    }];
}

@end
