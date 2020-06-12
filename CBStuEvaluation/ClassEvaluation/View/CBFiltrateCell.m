//
//  CBFiltrateCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBFiltrateCell.h"

@implementation CBFiltrateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = MediumFont(16);
        self.textLabel.textColor = RGB16(0x38383d);
        self.detailTextLabel.font = MediumFont(14);
        self.detailTextLabel.textColor = RGB16(0xc7c7c7);
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    self.textLabel.text = dict[@"text"];
    self.detailTextLabel.text = dict[@"detailText"];
}

- (void)setItemSubTitle:(NSString *)itemSubTitle {
    _itemSubTitle = itemSubTitle;
    self.detailTextLabel.text = itemSubTitle;
}

@end
