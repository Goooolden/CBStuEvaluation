//
//  CBEvlDefaultCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/1.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBEvlDefaultCell.h"
#import "TableViewBaseItem.h"

@interface CBEvlDefaultCell ()

@property (nonatomic, strong) UILabel *itemTitle;
@property (nonatomic, strong) UIImageView *itemAccessoryImage;

@end

@implementation CBEvlDefaultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.itemTitle];
        [self.contentView addSubview:self.itemAccessoryImage];
    }
    return self;
}

- (void)setItem:(TableViewBaseItem *)item {
    _item = item;
    self.itemTitle.text = item.itemTitle;
    self.itemAccessoryImage.image = [UIImage imageNamed:item.itemAccessoryImage];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.itemTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(16);
    }];
    
    [self.itemAccessoryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-16);
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

- (UIImageView *)itemAccessoryImage {
    if (!_itemAccessoryImage) {
        _itemAccessoryImage = [[UIImageView alloc] init];
    }
    return _itemAccessoryImage;
}

@end
