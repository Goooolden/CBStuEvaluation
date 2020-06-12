//
//  RequestApiConfig.h
//  CBStuManagement
//
//  Created by LANXUM on 2018/11/29.
//  Copyright © 2018 LANXUM. All rights reserved.
//

#ifndef RequestApiConfig_h
#define RequestApiConfig_h

#define kToken [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]

#pragma mark ------------ 服务器基地址
static NSString * const kOldBasicUrl = @"http://10.5.1.172:8087/";
static NSString * const kNewBasicUrl = @"http://10.5.1.4/micro/";
static NSString * const kApi_Base_Url              = kNewBasicUrl;


#pragma mark ------------ 模块前缀
static NSString * const kBase_Basis                = @"basis/";// 基础信息
static NSString * const kBase_ZS                   = @"zs/";// 德育
static NSString * const kBase_File                 = @"file/";// 附件
static NSString * const kBase_Attend               = @"attend/";// 课堂


#pragma mark ------------ 学生管理
/* ClassiList */
static NSString * const kApi_ClassList             = @"classList";// 获取班级(未使用)


/* Group */
static NSString * const kApi_CreateGroup           = @"createGroup";// 创建分组(未开放)
static NSString * const kApi_GroupList             = @"basis/group/listType";// 分组列表
static NSString * const kApi_GroupDetail           = @"basis/group/listGroupUsers";// 获取分组详情  某分组方案班内分组及组内成员情况
static NSString * const kApi_ListSelMember         = @"basis/group/listSelUsers";// 获取班级人员
static NSString * const kApi_DeleteGroupMember     = @"basis/group/delUsersByIds";// 删除分组成员
static NSString * const kApi_AddGroupMember        = @"basis/group/addUsers";// 添加分组成员


/* Seat */
static NSString * const kApi_CreateSeat            = @"createSeat";// 创建座次(未开放)
static NSString * const kApi_SeatList              = @"basis/seat/listSeat";// 座次列表
static NSString * const kApi_SeatDetail            = @"basis/seat/listUsers";// 获取座次详情
static NSString * const kApi_SeatMember            = @"basis/seat/listSeatUsers";// 获取座次人员
static NSString * const kApi_DeletetSeatMember     = @"basis/seat/delUsersByIds";// 删除座次人员
static NSString * const kApi_AddSeatMember         = @"basis/seat/setUsers";//安排座次


#pragma mark ------------ 德育评价
static NSString * const kApi_UploadFile            = @"file/uploadFile";// 上传图片
static NSString * const kApi_AddDyScore            = @"zs/addDyScore";//提交
static NSString * const kApi_ListEventByPower      = @"zs/listEventByPower";// 添加评价-指标项
static NSString * const kApi_listClassByEventId    = @"zs/listClazzByEventId";// 添加评价-人员
static NSString * const kApi_ZsListItem            = @"zs/listItem";// 打分项
static NSString * const kApi_MyCourse              = @"basis/pub/myCourse";// 课堂评价1/2
static NSString * const kApi_ListEventByCourse     = @"zs/listEventByCourse";// 课堂评价2/2-指标项
static NSString * const kApi_ListStudent           = @"basis/pub/listStudent";// 人员-班内学生
static NSString * const kApi_HeadPicture           = @"basis/pub//un/getHeadUrl";// 网络请求头像
static NSString * const kApi_ListDyScoreFromMy     = @"zs/listDyScoreFromMy";// 德育查询-查学生
static NSString * const kApi_ListFile              = @"file/listFile";// 查学生-图片
static NSString * const kApi_ListDyClazz           = @"zs/listDyClazz";// 德育查询-筛选


#pragma mark ------------ 课堂评价

//static NSString * const kApi_UploadFile            = @"file/uploadFile";// 上传图片
//static NSString * const kApi_MyCourse              = @"basis/pub/myCourse";// 课堂评价1/2
//static NSString * const kApi_ListEventByCourse     = @"zs/listEventByCourse";// 课堂评价2/2-指标项
static NSString * const kApi_ScoreItem             = @"zs/listItem";// 课堂评价2/2-打分项
static NSString * const kApi_SeatListSeatByCourse  = @"basis/seat/listSeatByCourse";// 学员-按座次查找类型
static NSString * const kApi_SeatListByUsers       = @"basis/seat/listUsers";// 学员-按座次
static NSString * const kApi_ListTypeByCourse      = @"basis/group/listTypeByCourse";// 学员-分组-找类型  分组方案(根据课程查询)
static NSString * const kApi_ListGroupingByUser    = @"basis/group/listGroupUsers";// 学员-分组  某分组方案班内分组及组内成员情况
static NSString * const kApi_ListStudentByCourseId = @"zs/listStudentByCourseId";// 学员-学生
static NSString * const kApi_Avator                = @"basis//pub/un/getHeadUrl";// 学员-学生-头像
static NSString * const kApi_AddClassScores        = @"zs/addClazzScores";// 评价提交
static NSString * const kApi_InquireScores         = @"zs/listClazzScoreFromMy";// 课堂记录-列表
static NSString * const kApi_Myclass               = @"basis/pub/listMyTeaClazz";// 筛选 -班级
static NSString * const kApi_InquireImage          = @"file/listFile";// 查记录详情-图片
//static NSString * const kApi_ListScoreByGroup = @"zs/listScoreByGroup";

#endif /* RequestApiConfig_h */
