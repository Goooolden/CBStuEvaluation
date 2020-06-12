//
//  TableViewBaseItem.h
//  UITableView 解耦
//
//  Created by LANXUM on 2018/10/29.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const CellInvalidHeight;

//NS_ASSUME_NONNULL_BEGIN

@interface TableViewBaseItem : NSObject

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy) NSString *itemId;

@property (nonatomic, copy) NSString *itemIdentifier;
@property (nonatomic, copy) NSString *itemImage;
@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *itemSubTitle;
@property (nonatomic, copy) NSString *itemAccessoryImage;

- (instancetype)initWithImage:(NSString *)image title:(NSString *)title subTitle:(NSString *)subTitle accessoryImage:(NSString *)accessoryImage;

@end

//NS_ASSUME_NONNULL_END
