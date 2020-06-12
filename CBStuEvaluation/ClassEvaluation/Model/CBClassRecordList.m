//
//  CBClassRecordList.m
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/12/27.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "CBClassRecordList.h"

@implementation CBClassRecordList

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list":@"RecordItem"};
}

@end

@implementation RecordItem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}

@end


@implementation MyTeachClass


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"itemId":@"id"
             };
}

@end

@implementation Photo

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"photoId":@"id"
             };
}

@end
