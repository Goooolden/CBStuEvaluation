//
//  CBEvlStyleValue1Cell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/1.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBEvlStyleValue1Cell.h"
#import "TableViewBaseItem.h"

@interface CBEvlStyleValue1Cell ()

@property (nonatomic, strong) UILabel *itemTitle;
@property (nonatomic, strong) UIImageView *itemImage;

@end

@implementation CBEvlStyleValue1Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.itemImage];
        [self.contentView addSubview:self.itemTitle];
    }
    return self;
}

- (void)setItem:(TableViewBaseItem *)item {
    _item = item;
    self.itemTitle.text = item.itemTitle;
    self.itemImage.image = [UIImage imageNamed:item.itemImage];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.itemImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
    }];
    
    [self.itemTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.itemImage.mas_right).offset(10);
    }];
}

- (UILabel *)itemTitle {
    if (!_itemTitle) {
        _itemTitle = [[UILabel alloc] init];
        _itemTitle.font = MediumFont(16);
        _itemTitle.textColor = RGBA(56, 56, 61, 1);
        _itemTitle.textAlignment = NSTextAlignmentLeft;
    }
    return _itemTitle;
}

- (UIImageView *)itemImage {
    if (!_itemImage) {
        _itemImage = [[UIImageView alloc] init];
    }
    return _itemImage;
}

@end

