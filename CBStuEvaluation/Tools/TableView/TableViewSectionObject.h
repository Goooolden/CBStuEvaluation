//
//  TableViewSectionObject.h
//  UITableView 解耦
//
//  Created by LANXUM on 2018/10/29.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewSectionObject : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTilte;

@property (nonatomic, strong) NSMutableArray *items;

- (instancetype)initWithItemArray:(NSMutableArray *)items;

@end

NS_ASSUME_NONNULL_END
