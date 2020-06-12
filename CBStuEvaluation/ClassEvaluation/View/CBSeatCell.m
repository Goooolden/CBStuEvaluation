//
//  CBSeatCell.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBSeatCell.h"

@interface CBSeatCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *seatingLabel;

@end

@implementation CBSeatCell

#pragma mark - Initializers

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.seatingLabel];
    }
    return self;
}

//- (void)setIndex:(NSInteger)index {
//    _index = index;
//    self.seatingLabel.text = [NSString stringWithFormat:@"%ld",index];
//}

- (void)setUser:(User *)user {
    _user = user;
    self.nameLabel.text = user.name;
    self.seatingLabel.text = [NSString stringWithFormat:@"%ld/%ld", user.row, user.col];
    //    self.seatingLabel.text =
}

#pragma mark - Lifecycle
- (void)layoutSubviews {
    [super layoutSubviews];

    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(16);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.iconView.mas_bottom).offset(12);
    }];
    
    [self.seatingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(6);
        make.right.equalTo(self.contentView).offset(-6);
    }];
}

#pragma mark - Private variables

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"icon_Seat_User__default"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = MediumFont(14);
        _nameLabel.textColor = RGBA(56, 56, 61, 1);
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"李慧然";
    }
    return _nameLabel;
}

- (UILabel *)seatingLabel {
    if (!_seatingLabel) {
        _seatingLabel = [[UILabel alloc] init];
        _seatingLabel.font = MediumFont(10);
        _seatingLabel.textColor = RGBA(121, 133, 156, 1);
        _seatingLabel.textAlignment = NSTextAlignmentRight;
        _seatingLabel.text = @"1/1";
    }
    return _seatingLabel;
}

@end
