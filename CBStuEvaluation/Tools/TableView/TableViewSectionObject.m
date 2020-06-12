//
//  TableViewSectionObject.m
//  UITableView 解耦
//
//  Created by LANXUM on 2018/10/29.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewSectionObject.h"

@implementation TableViewSectionObject

- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerTitle = @"";
        self.footerTilte = @"";
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithItemArray:(NSMutableArray *)items {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
        [self.items addObjectsFromArray:items];
    }
    return self;
}

@end
