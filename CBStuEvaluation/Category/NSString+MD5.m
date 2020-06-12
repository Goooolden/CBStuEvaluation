//
//  NSString+MD5.m
//  CBStuManagement
//
//  Created by LANXUM on 2019/1/8.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

// 返回32个字符的MD5散列字符串
- (NSString *)md5String {
    const char *str = [self UTF8String];
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [strM appendFormat:@"%02x", buffer[i]];
    }
    
    return strM;
}

@end
