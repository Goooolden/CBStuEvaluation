//
//  CBClassRecordQuiryController.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/30.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import "TableViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^QuiryKeyWord)(NSString *className, NSString *sDate, NSString *eDate);

@interface CBClassRecordQuiryController : TableViewController

@property (nonatomic, copy) QuiryKeyWord keyWord;

@end

NS_ASSUME_NONNULL_END
