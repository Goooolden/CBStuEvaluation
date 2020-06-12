//
//  ListTypeByCourse.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListTypeByCourse : NSObject

@property (nonatomic, copy) NSString *itemId;//分组类型ID
@property (nonatomic, copy) NSString *name;//类型名称
@property (nonatomic, copy) NSString *type;//类型1公共，2其他
@property (nonatomic, assign) BOOL state;//boolean是否可用
@property (nonatomic, copy) NSString *clazzId;//班级ID
@property (nonatomic, copy) NSString *clazz;
@property (nonatomic, copy) NSString *assId;
@property (nonatomic, copy) NSString *assName;
@property (nonatomic, copy) NSString *assUsername;

@end

NS_ASSUME_NONNULL_END
