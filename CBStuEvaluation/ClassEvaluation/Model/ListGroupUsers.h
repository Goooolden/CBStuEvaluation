//
//  ListGroupUsers.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

NS_ASSUME_NONNULL_BEGIN

@interface ListGroupUsers : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *clazzId;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sortNum;
@property (nonatomic, copy) NSArray <User *>*users;

@end

@interface User : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *usersId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *username;
/* 以下两字段为座次独有*/
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger col;
@property (nonatomic, assign) NSInteger score;

@end

NS_ASSUME_NONNULL_END
