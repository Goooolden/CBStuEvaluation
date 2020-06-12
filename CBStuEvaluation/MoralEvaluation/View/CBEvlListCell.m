//
//  CBEvlListCell.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/12.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBEvlListCell.h"

@interface CBEvlListCell ()

@property (nonatomic, strong) UIView *backGroudView;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIImageView *line;
@property (nonatomic, strong) UILabel *targetLab1;
@property (nonatomic, strong) UILabel *targetLab2;
@property (nonatomic, strong) UILabel *detailLab;
@property (nonatomic, strong) UIView *scrollView;
@property (nonatomic, strong) UIImageView *pictureView;

@end

@implementation CBEvlListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self.contentView addSubview:self.backGroudView];
        [self.backGroudView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
        
        [self.backGroudView addSubview:self.timeLab];
        [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backGroudView);
            make.left.equalTo(self.backGroudView).offset(10);
            make.height.mas_equalTo(40);
        }];
        
        [self.backGroudView addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLab.mas_bottom);
            make.left.equalTo(self.backGroudView).offset(10);
            make.right.equalTo(self.backGroudView).offset(-10);
            make.height.mas_equalTo(1);
        }];
        
        [self.backGroudView addSubview:self.targetLab1];
        [self.targetLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(15);
            make.left.equalTo(self.backGroudView).offset(10);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(47);
        }];
        
        [self.backGroudView addSubview:self.targetLab2];
        [self.targetLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(15);
            make.left.equalTo(self.targetLab1.mas_right).offset(10);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(47);
        }];
        
        self.detailLab = [UILabel new];
        self.detailLab.numberOfLines = 0;
        self.detailLab.attributedText = [self test];
        [self.contentView addSubview:self.detailLab];
        [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.targetLab2.mas_bottom).offset(12);
            make.left.equalTo(self.backGroudView).offset(10);
        }];
        
        
        
        self.pictureView = [[UIImageView alloc] init];
        self.pictureView.image = [UIImage imageNamed:@"icon_classStatistics"];
        
        [self.backGroudView addSubview:self.pictureView];
        
        CGFloat imageViewWidth = (self.contentView.width)/3;
        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.backGroudView).offset(10);
            make.top.equalTo(self.detailLab.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(imageViewWidth, imageViewWidth));
            //        make.height.equalTo(@(imageViewWidth));
            //        make.width.equalTo(@(self.contentView.width-20));
        }];
//        self.clipsToBounds = YES;
//        self.layer.cornerRadius = 6;
//        self.layer.masksToBounds = YES;
//        self.backgroundColor = [UIColor whiteColor];
//
//        [self.contentView addSubview:self.timeLab];
//
//        [self.contentView addSubview:self.line];
////        [self.contentView bringSubviewToFront:self.line];
//        [self.contentView addSubview:self.targetLab1];
//        [self.contentView addSubview:self.targetLab2];
//
//        [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView);
//            make.left.equalTo(self.contentView).offset(10);
//            make.height.mas_equalTo(40);
//        }];
//
//
//        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.timeLab.mas_bottom);
//            make.left.equalTo(self.contentView).offset(10);
//            make.right.equalTo(self.contentView).offset(-10);
//            make.height.mas_equalTo(1);
//        }];
//
//        [self.targetLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.line.mas_bottom).offset(15);
//            make.left.equalTo(self.contentView).offset(10);
//            make.height.mas_equalTo(25);
//            make.width.mas_equalTo(47);
//        }];
//
//        [self.targetLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.line.mas_bottom).offset(15);
//            make.left.equalTo(self.targetLab1.mas_right).offset(10);
//            make.height.mas_equalTo(25);
//            make.width.mas_equalTo(47);
//        }];
//
//        self.detailLab = [UILabel new];
//        self.detailLab.numberOfLines = 0;
//        self.detailLab.attributedText = [self test];
//        [self.contentView addSubview:self.detailLab];
//        [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.targetLab2.mas_bottom).offset(12);
//            make.left.equalTo(self.contentView).offset(10);
//        }];
//
//
//
//        self.pictureView = [[UIImageView alloc] init];
//        self.pictureView.image = [UIImage imageNamed:@"icon_classStatistics"];
//
//        [self.contentView addSubview:self.pictureView];
//
//        CGFloat imageViewWidth = (self.contentView.width)/3;
//        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView).offset(10);
//            make.top.equalTo(self.detailLab.mas_bottom).offset(10);
//            make.size.mas_equalTo(CGSizeMake(imageViewWidth, imageViewWidth));
//            //        make.height.equalTo(@(imageViewWidth));
//            //        make.width.equalTo(@(self.contentView.width-20));
//        }];
//        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.contentView).offset(10);
//            make.top.equalTo(self.detailLab.mas_bottom).offset(10);
//            make.size.mas_equalTo(CGSizeMake(imageViewWidth, imageViewWidth));
//        }];
        
//        self.scrollView = [[UIView alloc] init];
//        [self.contentView addSubview:self.scrollView];
//        self.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];

        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    CGFloat imageViewWidth = (self.contentView.width-40)/3;
//    [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentView).offset(10);
//        make.top.equalTo(self.detailLab.mas_bottom).offset(10);
//        make.size.mas_equalTo(CGSizeMake(imageViewWidth, imageViewWidth));
////        make.height.equalTo(@(imageViewWidth));
////        make.width.equalTo(@(self.contentView.width-20));
//    }];
    
    
 
    

}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    //2、设置起点
//    [path moveToPoint:CGPointMake(CGRectGetMinX(self.timeLab.frame), CGRectGetMaxY(self.timeLab.frame))];
//    //设置终点
//    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.timeLab.frame), CGRectGetMaxY(self.timeLab.frame))];
//
//    [path setLineWidth:1.0];
//    //    [path setLineJoinStyle:kCGLineJoinBevel];
//    //    [path setLineCapStyle:kCGLineCapButt];
//    [[UIColor redColor] setStroke];
//
//    //3、渲染上下文到View的layer
//    [path stroke];
//}

- (UIView *)backGroudView {
    if (!_backGroudView) {
        _backGroudView = [[UIView alloc] init];
        _backGroudView.backgroundColor = UIColor.whiteColor;
        _backGroudView.clipsToBounds = YES;
        _backGroudView.layer.cornerRadius = 6;
        _backGroudView.layer.masksToBounds = YES;
        _backGroudView.backgroundColor = [UIColor whiteColor];
    }
    return _backGroudView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.text = @"2018-05-06 08:30";
        _timeLab.textColor = RGBA(142, 142, 147, 1);
        _timeLab.font = RegularFont(14);
        _timeLab.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLab;
}

- (UIImageView *)line {
    if (!_line) {
 
        
        
        _line = [[UIImageView alloc] init];
//        _line.image = [self createImageWithColor:UIColor.orangeColor];
        _line.image = [self createImageWithColor:RGB16(0xd9d9d9)];
    }
    return _line;
}

- (UILabel *)targetLab1 {
    if (!_targetLab1) {
        _targetLab1 = [[UILabel alloc] init];
        _targetLab1.text = @"生活";
        _targetLab1.textColor = RGBA(90, 163, 255, 1);
        _targetLab1.font = RegularFont(14);
        _targetLab1.textAlignment = NSTextAlignmentCenter;
        _targetLab1.layer.borderWidth = 1.0;
        _targetLab1.layer.cornerRadius = 4.0;
        _targetLab1.layer.borderColor = RGBA(90, 163, 255, 1).CGColor;
//        [_targetLab1 sizeToFit];
    }
    return _targetLab1;
}

- (UILabel *)targetLab2 {
    if (!_targetLab2) {
        _targetLab2 = [[UILabel alloc] init];
        _targetLab2.text = @"卫生";
        _targetLab2.textColor = RGBA(90, 163, 255, 1);
        _targetLab2.font = RegularFont(14);
        _targetLab2.textAlignment = NSTextAlignmentCenter;
        _targetLab2.layer.borderWidth = 1.0;
        _targetLab2.layer.cornerRadius = 4.0;
        _targetLab2.layer.borderColor = RGBA(90, 163, 255, 1).CGColor;
//        [_targetLab2 sizeToFit];
    }
    return _targetLab2;
}

- (NSAttributedString *)test {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 10;
    NSAttributedString *name = [[NSAttributedString alloc] initWithString:@"张晓波、张祥、单欢等\n" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size:16], NSForegroundColorAttributeName: [UIColor colorWithHexString:@"0x38383d" alpha:1],NSParagraphStyleAttributeName:paraStyle}];
    
    NSAttributedString *reason = [[NSAttributedString alloc] initWithString:@"因为某某原因+5分\n因为某某原因+5分" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Regular" size:14], NSForegroundColorAttributeName: [UIColor colorWithHexString:@"0xc7c7c7" alpha:1]}];
    
    NSMutableAttributedString *test = [[NSMutableAttributedString alloc] initWithAttributedString:name];
    [test appendAttributedString:reason];
    
    return test;
}

@end
