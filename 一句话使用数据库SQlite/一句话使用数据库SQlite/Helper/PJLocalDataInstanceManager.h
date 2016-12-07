//
//  PJLocalDataInstanceManager.h
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/5.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "FMDB.h"
#import <Foundation/Foundation.h>
#import "PJLocalDataManagerModel.h"

@interface PJLocalDataInstanceManager : NSObject

+ (PJLocalDataInstanceManager *)shareInstanceManger;

// 加载数据库
+ (BOOL)openDB;

+ (BOOL)openDBWithName:(NSString *)dbName;

// 初始化数据库表
+ (void)initDBTable;

// 插入单个课件
+ (BOOL)insertCourseware:(PJLocalDataManagerModel *)coursewareModel;

// 插入一组课件
+ (BOOL)insertCourse:(NSArray *)arrayModel;

// 查询课件的下载状态
+ (NSString *)queryIsDownloadStatus:(PJLocalDataManagerModel *)coursewareModel;

+ (NSArray *)queryIsDownloadStatusWithUid:(NSString *)uid;

// 加载数据库中所有的数据
+ (NSArray *)queryAllData_DB;

// 更新下载状态
+ (void)updateDownloadStateWithCoursewareId:(NSString *)coursewareId;

// 删除uid对应的数据
+ (void)deleteStateWithCoursewareId:(NSString *)coursewareId;

//+ (NSString *)queryIsDownloadCoursewareWithModel:(PJLocalDataManagerModel *)coursewareModel;

@end
