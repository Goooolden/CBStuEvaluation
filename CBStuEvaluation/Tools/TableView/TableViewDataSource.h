//
//  TableViewDataSource.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface TableViewDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
