//
//  NSString+MD5.h
//  CBStuManagement
//
//  Created by LANXUM on 2019/1/8.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MD5)

// 返回32个字符的MD5散列字符串
- (NSString *)md5String;

@end

NS_ASSUME_NONNULL_END
