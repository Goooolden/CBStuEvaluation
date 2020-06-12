//
//  CBListEvenModel.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2019/1/2.
//  Copyright © 2019 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBListEvenModel : NSObject

@property (nonatomic, copy) NSArray *children;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *name;

@end

@interface Children : NSObject

@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy)  NSString *itemId;
@property (nonatomic, assign) NSInteger max;
@property (nonatomic, assign) NSInteger min;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
