//
//  BaseHandler.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/12/10.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface BaseHandler : NSObject

+ (void)executeRequestWithURL:(NSString *)url
                      headers:(NSString *)headers
                       params:(NSDictionary *)params
                      success:(HttpSuccess)success
                      failure:(HttpFailure)failure;
@end

//NS_ASSUME_NONNULL_END
