//
//  CBGetToken.m
//  CBStuManagement
//
//  Created by LANXUM on 2019/1/16.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import "CBGetToken.h"
#import "NSString+MD5.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

@implementation CBGetToken

//旧版本
/*
+ (void)getToken {
    NSString *name = @"admin";
    NSString *pwd = @"111111";
    NSString *md5 = [pwd md5String];
    
    NSString *param = [@{@"username": name, @"password": md5} mj_JSONString];

    [HTTPTool postWithURL:[NSString stringWithFormat:@"%@%@", kApi_Base_Url, @"auth/token/json"] headers:nil params:@{@"param":param} success:^(id json) {
        if ([json[@"result"] integerValue] == 1) {
            NSString *token = json[@"data"][@"token"];
            if (token.length != 0) {
                [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
            }
        }
    } failure:^(NSError *error) {
        
    }];
}
*/

+ (void)getToken {
    NSString *name = @"admin";
    NSString *pwd = @"111111";
    NSString *md5 = [pwd md5String];
    
    NSDictionary *param = @{@"username": name, @"password": md5};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://10.5.1.4/micro/auth/token" parameters:param headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *token = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
