//
//  PJLocalDataInstanceManager.m
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/5.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "PJLocalDataInstanceManager.h"

#define hentaneDB_Local_CourseInfomation @"hentaneDB_Local_CourseInfomation"
#define DB_Path_Local [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

@interface PJLocalDataInstanceManager ()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation PJLocalDataInstanceManager

#pragma mark - 创建单利
+(PJLocalDataInstanceManager *)shareInstanceManger {

    static PJLocalDataInstanceManager *instanceManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        instanceManager = [[PJLocalDataInstanceManager alloc] init];
    });
    return instanceManager;
}

#pragma mark - 加载数据库
+ (BOOL)openDB {

    return [PJLocalDataInstanceManager openDBWithName:@"hentane"];
}

+ (BOOL)openDBWithName:(NSString *)dbName {
    
    return [[self shareInstanceManger] openDBWithName:dbName];
}

// yes: 数据库打开正常
- (BOOL)openDBWithName:(NSString *)dbName {
    
    NSString *path = [DB_Path_Local stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db", dbName]];
    
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    [db shouldCacheStatements];
    self.db = db;
    if ([db open]) {
        
        PJLog(@"SQLite数据库 打开 成功!");
        return YES;
    } else {
        
        PJLog(@"数据库未能 创建/打开 失败!");
        return NO;
    }
}

#pragma mark - 初始化数据库表
+ (void)initDBTable {

    [[self shareInstanceManger] initDBTable];
}

- (void)initDBTable {

    // 1. 检测数据库打开状态
    if ([PJLocalDataInstanceManager openDB]) {
      
//        PJLog(@"%d", [self.db tableExists:hentaneDB_Local_CourseInfomation]);
        if (![self.db tableExists:hentaneDB_Local_CourseInfomation]) { // 数据表不存在, 就创建表
        
            NSString *sql = @"create table if not exists hentaneDB_Local_CourseInfomation(id integer PRIMARY KEY AUTOINCREMENT," "uid text NOT NULL, courseId text NOT NULL, coursewareId text NOT NULL, depthType text NOT NULL, cwId text, name text, isDownload text)";
            [self.db executeUpdate:sql];
        } else {
        
            // 旧项目中去重操作
//            [db executeUpdate:@"delete from course_info where exists(select 1 from course_info a where a.userid=course_info.userid and a.courseDetailId=course_info.courseDetailId and a._id<course_info._id and a.isDownload<=course_info.isDownload)"];
        }
        
        // 添加字段
        if (![self.db columnExists:@"imgUrl" inTableWithName:hentaneDB_Local_CourseInfomation]) {
            
            NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ text",hentaneDB_Local_CourseInfomation, @"imgUrl"];
            [self.db executeUpdate:sql];
        }
        
        if (![self.db columnExists:@"downloadPath" inTableWithName:hentaneDB_Local_CourseInfomation]) {
        
            NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ text", hentaneDB_Local_CourseInfomation, @"downloadPath"];
            [self.db executeUpdate:sql];
        }
    }
}

#pragma mark - 插入单个课件
+ (BOOL)insertCourseware:(PJLocalDataManagerModel *)courseModel {

    return [[self shareInstanceManger] insertCourseSubject:courseModel];
}

- (BOOL)insertCourseSubject:(PJLocalDataManagerModel *)courseModel {

    if (![self existswithCourseId:courseModel]) {
        
        PJLog(@"插入单条数据");
        return [self.db executeUpdate:[self setCourseTable:@"insert into %@ (uid, courseId, coursewareId, depthType, cwId, name, isDownload, imgUrl, downloadPath) values(?, ?, ?, ?, ?, ?, ?, ?, ?)"], courseModel.uid, courseModel.courseId, courseModel.coursewareId, courseModel.depthType, courseModel.cwId, courseModel.name, courseModel.isDownload, courseModel.imgUrl, courseModel.downloadPath];
    }
    return NO;
}

+ (BOOL)insertCourse:(NSArray *)arrayModel {
    
    return [[self shareInstanceManger] insertCourse:arrayModel];
}

- (BOOL)insertCourse:(NSArray *)arrayModel {

    [self.db beginTransaction];

    for (PJLocalDataManagerModel *model in arrayModel) {
        
        [self insertCourseSubject:model];
    }
    
    [self.db commit];
    
    return NO;
}

#pragma mark - 查询课件的状态
+ (NSString *)queryIsDownloadStatus:(PJLocalDataManagerModel *)coursewareModel {

    return [[self shareInstanceManger] queryIsDownloadStatus:coursewareModel];
}

- (NSString *)queryIsDownloadStatus:(PJLocalDataManagerModel *)coursewareModel {
    
    FMResultSet *rset = [self.db executeQuery:[self setCourseTable:@"select * from %@ where uid=? and coursewareId=?"], coursewareModel.uid, coursewareModel.coursewareId];
    
    NSString *isDownload = nil;
    while ([rset next]) {
        isDownload = [rset stringForColumn:@"isDownload"];
    }
    return isDownload;
}

+(NSArray *)queryIsDownloadStatusWithUid:(NSString *)uid {

    return [[self shareInstanceManger] queryIsDownloadStatusWithUid:uid];
}

-(NSArray *)queryIsDownloadStatusWithUid:(NSString *)uid {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    FMResultSet *rSet = [self.db executeQuery:[self setCourseTable:@"select * from %@ where uid=? and (isDownload=? or isDownload=? )"], uid, @"1", @"2"];
    while ([rSet next]) {
        
        PJLocalDataManagerModel *model = [[PJLocalDataManagerModel alloc] init];
        
        model.uid = [rSet stringForColumn:@"uid"];
        model.courseId = [rSet stringForColumn:@"courseId"];
        model.coursewareId = [rSet stringForColumn:@"coursewareId"];
        model.depthType = [rSet stringForColumn:@"depthType"];
        model.cwId = [rSet stringForColumn:@"cwId"];
        model.name = [rSet stringForColumn:@"name"];
        model.isDownload = [rSet stringForColumn:@"isDownload"];
        model.imgUrl = [rSet stringForColumn:@"imgUrl"];
        model.downloadPath = [rSet stringForColumn:@"downloadPath"];
        
        [array addObject:model];
    }
    
    return array.copy;
}

// 加载数据库中所有的数据
+ (NSArray *)queryAllData_DB {
    
    return [[self shareInstanceManger] queryAllData_DB];
}

- (NSArray *)queryAllData_DB {

    NSMutableArray *array = [[NSMutableArray alloc] init];
    FMResultSet *rSet = [self.db executeQuery:[self setCourseTable:@"select * from %@"]];
    while ([rSet next]) {
        
        PJLocalDataManagerModel *model = [[PJLocalDataManagerModel alloc] init];
        
        model.uid = [rSet stringForColumn:@"uid"];
        model.courseId = [rSet stringForColumn:@"courseId"];
        model.coursewareId = [rSet stringForColumn:@"coursewareId"];
        model.depthType = [rSet stringForColumn:@"depthType"];
        model.cwId = [rSet stringForColumn:@"cwId"];
        model.name = [rSet stringForColumn:@"name"];
        model.isDownload = [rSet stringForColumn:@"isDownload"];
        model.imgUrl = [rSet stringForColumn:@"imgUrl"];
        model.downloadPath = [rSet stringForColumn:@"downloadPath"];
        
        [array addObject:model];
    }
    
    return array.copy;
}

// 更新下载状态
+ (void)updateDownloadStateWithCoursewareId:(NSString *)coursewareId {

    [[self shareInstanceManger] updateDownloadStateWithCoursewareId:coursewareId];
}

- (void)updateDownloadStateWithCoursewareId:(NSString *)coursewareId {
    
    [self.db executeUpdate:[self setCourseTable:@"update %@ set isDownload=?  where coursewareId=? "], @"888", coursewareId];
}

// 删除uid对应的数据
+ (void)deleteStateWithCoursewareId:(NSString *)coursewareId {
    
    [[self shareInstanceManger] deleteStateWithCoursewareId:coursewareId];
}

- (void)deleteStateWithCoursewareId:(NSString *)coursewareId {

    [self.db executeUpdate:[self setCourseTable:@"delete from %@  where coursewareId=? "], coursewareId];
}

#pragma mark - 是否存在课件
-(BOOL)existswithCourseId:(PJLocalDataManagerModel *)courseware {

    // 播放课件视频的id
    FMResultSet *rset = [self.db executeQuery:[self setCourseTable:@"select count(*) from %@ where uid=? and coursewareId=?"], courseware.uid, courseware.coursewareId];
    if ([rset next]) {
    
        // courseware.uid, courseware.coursewareId 同时相同才会返回1
        NSUInteger count = [rset intForColumnIndex:0];
        if (count > 0) {
        
            return YES;
        } else {
        
            return NO;
        }
    }
    
    [rset close];
    return NO;
}

// 创建数据库表
-(NSString *)setCourseTable:(NSString *)sql
{
    return [NSString stringWithFormat:sql, hentaneDB_Local_CourseInfomation];
}

@end
