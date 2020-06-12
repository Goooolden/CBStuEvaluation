//
//  CBClassRecordCell.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/10/26.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBClassRecordList.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBClassRecordCell : UITableViewCell

//@property (nonatomic, copy) NSDictionary *dict;
@property (nonatomic, strong) RecordItem *item;

@end

NS_ASSUME_NONNULL_END
