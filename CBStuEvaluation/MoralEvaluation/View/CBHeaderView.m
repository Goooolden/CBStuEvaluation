//
//  CBHeaderView.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/12.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBHeaderView.h"

@interface CBHeaderView ()

@property (nonatomic, strong) UILabel *itemTileLab;

@end

@implementation CBHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.itemTileLab];
        
        [self.itemTileLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.top.right.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.itemTileLab.text = title;
}

- (UILabel *)itemTileLab {
    if (!_itemTileLab) {
        _itemTileLab = [[UILabel alloc] init];
        _itemTileLab.font = MediumFont(14);
        _itemTileLab.textColor = RGBA(136, 136, 136, 1);
        _itemTileLab.textAlignment = NSTextAlignmentLeft;
    }
    return _itemTileLab;
}

@end
