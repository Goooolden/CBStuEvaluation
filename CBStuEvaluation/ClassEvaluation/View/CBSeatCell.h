//
//  CBSeatCell.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/10/25.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListGroupUsers.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBSeatCell : UICollectionViewCell

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) User *user;

@end

NS_ASSUME_NONNULL_END
