//
//  BaseHandler.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "BaseHandler.h"
#import "HTTPTool.h"

@implementation BaseHandler

+ (void)executeRequestWithURL:(NSString *)url
                      headers:(NSString *)headers
                       params:(NSDictionary *)params
                      success:(HttpSuccess)success
                      failure:(HttpFailure)failure {
    [HTTPTool postWithURL:[NSString stringWithFormat:@"%@%@", kApi_Base_Url, url] headers:@{@"token": headers} params:@{@"param": [self jsonStringWithDicitonary:params]} success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (NSString *)jsonStringWithDicitonary:(NSDictionary *)dic {
    if (!dic) {
        return @"";
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (!error) {
        return jsonStr;
    }
    return @"";
}

@end
