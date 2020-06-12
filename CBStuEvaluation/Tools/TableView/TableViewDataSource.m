//
//  TableViewDataSource.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation TableViewDataSource

- (id)init {
    return nil;
}

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.items[(NSInteger) indexPath.section] isKindOfClass:[NSArray class]]) {
        NSArray *sectionArrays = self.items[(NSUInteger) indexPath.section];
        return sectionArrays[(NSUInteger) indexPath.row];
    }
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.items[(NSUInteger)section] isKindOfClass:[NSArray class]]) {
        NSArray *sectionArrays = self.items[(NSUInteger)section];
        return sectionArrays.count;
    }
    return self.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.items.count == 0) {
        return 0;
    }
    if ([self.items.lastObject isKindOfClass:[NSArray class]]) {
        return self.items.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
