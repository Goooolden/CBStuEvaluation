//
//  CBFooterView.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/11/20.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBFooterView.h"
#import "CBTextViewCell.h"
#import "SelectPictureView.h"

@interface CBFooterView ()

@property (nonatomic, strong) CBTextViewCell *textViewxCell;
@property (nonatomic, strong) SelectPictureView *selectPictureView;

@end

@implementation CBFooterView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.textViewxCell = [[CBTextViewCell alloc] init];
    self.selectPictureView = [[SelectPictureView alloc] init];
    self.selectPictureView.maxLineNum = 3;
    self.selectPictureView.maxPhotoNum = 9;
    
    [self.textViewxCell mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    
    
    [self.selectPictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}



@end
