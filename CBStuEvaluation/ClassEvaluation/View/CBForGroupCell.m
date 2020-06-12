//
//  CBForGroupCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBForGroupCell.h"

@interface CBForGroupCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subTextLabel;

@end

@implementation CBForGroupCell

#pragma mark - Initializers

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.subTextLabel];
    }
    return self;
}


#pragma mark - Lifecycle
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(22);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.iconView.mas_right).offset(10);
    }];
    
    [self.subTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-22);
    }];
}

- (void)setItem:(TableViewBaseItem *)item {
    _item = item;
    self.nameLabel.text = item.itemTitle;
    self.subTextLabel.text = item.itemSubTitle;
}

#pragma mark - Private variables

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        NSString *imageName = @"";
        if ([self.reuseIdentifier isEqualToString:@"CBForGroupCell"]) {
            imageName = @"icon_group_default";
        }else {
            imageName = @"icon_Seat_User__default";
        }
        _iconView.image = [UIImage imageNamed:imageName];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = MediumFont(16);
        _nameLabel.textColor = RGB16(0x38383d);
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"第一组";
    }
    return _nameLabel;
}

- (UILabel *)subTextLabel {
    if (!_subTextLabel) {
        _subTextLabel = [[UILabel alloc] init];
        _subTextLabel.font = MediumFont(14);
        _subTextLabel.textColor = RGB16(0xc7c7c7);
        _subTextLabel.textAlignment = NSTextAlignmentRight;
        _subTextLabel.text = @"合计20分";
    }
    return _subTextLabel;
}

@end
