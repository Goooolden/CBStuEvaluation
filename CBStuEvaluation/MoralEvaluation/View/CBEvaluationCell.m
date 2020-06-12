//
//  CBEvaluationCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/31.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBEvaluationCell.h"

@interface CBEvaluationCell ()

@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UILabel *itemSubTitle;
//@property (nonatomic, strong) UIImageView *accessoryView;
//
@end

@implementation CBEvaluationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = MediumFont(16);
        self.textLabel.textColor = RGBA(56, 56, 61, 1);
        self.detailTextLabel.font = [UIFont systemFontOfSize:14];
        self.detailTextLabel.textColor = RGB16(0xc7c7c7);
//        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"per_add"]];
    }
    return self;
}


- (void)setDict:(NSDictionary *)dict {
    self.accessoryType = UITableViewCellAccessoryNone;
    _dict = dict;
    self.textLabel.text = dict[@"text"];
    
    if (_dict[@"image"]) {
        self.imageView.image = [UIImage imageNamed:_dict[@"image"]];
    }
    
    if (_dict[@"accessoryImage"]) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"per_add"]];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    // Configure the view for the selected state
}

@end
