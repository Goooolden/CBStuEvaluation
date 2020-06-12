//
//  TableViewBaseItem.m
//  UITableView 解耦
//
//  Created by LANXUM on 2018/10/29.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewBaseItem.h"

CGFloat const CellInvalidHeight = -1;

@implementation TableViewBaseItem

- (instancetype)init {
    self = [self initWithImage:nil title:nil subTitle:nil accessoryImage:nil];
    return self;
}

- (instancetype)initWithImage:(NSString *)image title:(NSString *)title subTitle:(NSString *)subTitle accessoryImage:(NSString *)accessoryImage {
    self = [super init];
    if (self) {
        _cellHeight = CellInvalidHeight;
        _itemImage = image;
        _itemTitle = title;
        _itemSubTitle = subTitle;
        _itemAccessoryImage = accessoryImage;
    }
    return self;
}

@end
