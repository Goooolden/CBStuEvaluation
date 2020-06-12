//
//  CBListEvenModel.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2019/1/2.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import "CBListEvenModel.h"

@implementation CBListEvenModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"children":@"Children"};
}

@end

@implementation Children

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}


@end
