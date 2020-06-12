//
//  CBGoupScoreModel.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2019/1/2.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListGroupUsers.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBGoupScoreModel : NSObject

@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray <User *>*users;

@end

NS_ASSUME_NONNULL_END
