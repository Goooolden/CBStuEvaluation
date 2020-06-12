//
//  ListGroupUsers.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "ListGroupUsers.h"

@implementation ListGroupUsers

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"users":@"User"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}

@end

@implementation User

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}

@end
