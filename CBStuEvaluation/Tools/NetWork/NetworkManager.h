//
//  NetworkManager.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AFHTTPSessionManager;

typedef NS_ENUM(NSUInteger, NetworkStatusType) {
    NetworkStatusUnknown,           // 未知网络
    NetworkStatusNotReachable,      // 无网络
    NetworkStatusReachableViaWWAN,  // 手机网络
    NetworkStatusReachableViaWiFi   // WIFI网络
};

typedef void (^NetworkStatus)(NetworkStatusType status);

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

/**
 实时获取网络状态,通过Block回调实时获取
 */
+ (void)networkStatusWithBlock:(NetworkStatus)networkStatus;

/**
 有网YES, 无网:NO
 */
+ (BOOL)isNetwork;

/**
 手机网络:YES, 反之:NO
 */
+ (BOOL)isWWANNetwork;

/**
 WiFi网络:YES, 反之:NO
 */
+ (BOOL)isWiFiNetwork;


@end

NS_ASSUME_NONNULL_END
