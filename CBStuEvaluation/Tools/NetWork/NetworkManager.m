//
//  NetworkManager.m
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>

@implementation NetworkManager

#pragma mark - 开始监听网络
+ (void)networkStatusWithBlock:(NetworkStatus)networkStatus {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    networkStatus ? networkStatus(NetworkStatusUnknown) : nil;
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    networkStatus ? networkStatus(NetworkStatusNotReachable) : nil;
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    networkStatus ? networkStatus(NetworkStatusReachableViaWWAN) : nil;
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    networkStatus ? networkStatus(NetworkStatusReachableViaWiFi) : nil;
                    break;
            }
        }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
}

+ (BOOL)isNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

+ (BOOL)isWWANNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

+ (BOOL)isWiFiNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

@end
