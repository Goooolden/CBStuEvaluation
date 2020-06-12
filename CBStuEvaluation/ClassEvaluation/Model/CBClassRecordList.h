//
//  CBClassRecordList.h
//  CBStuEvaluation
//
//  Created by LANXUM on 2018/12/27.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RecordItem;
@class Photo;

NS_ASSUME_NONNULL_BEGIN

@interface CBClassRecordList : NSObject

@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) BOOL hasNextPage;
@property (nonatomic, assign) BOOL lastPage;
@property (nonatomic, assign) BOOL firstPage;
@property (nonatomic, copy) NSArray <RecordItem *> *list;

@end

@interface RecordItem : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *courseId;
@property (nonatomic, copy) NSString *course;
@property (nonatomic, copy) NSString *evaedUsersId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *eventId;
@property (nonatomic, copy) NSString *event;
@property (nonatomic, copy) NSString *event1;
@property (nonatomic, copy) NSString *event2;
@property (nonatomic, copy) NSString *item;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSString *evaType;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *evaName;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) BOOL state;
@property (nonatomic, copy) NSArray <Photo *>* photos;

@end

@interface MyTeachClass : NSObject

@property (nonatomic, copy) NSString *clazzId;
@property (nonatomic, copy) NSString *gradeName;
@property (nonatomic, copy) NSString *name;


//
@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *clazz;
@property (nonatomic, copy) NSString *teacherName;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *week;
@property (nonatomic, copy) NSString *numofday;


@end


@interface Photo : NSObject

@property (nonatomic, copy) NSString *photoId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) BOOL state;;

@end

NS_ASSUME_NONNULL_END
