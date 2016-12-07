//
//  PJLocalDataManagerModel.h
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/6.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJLocalDataManagerModel : NSObject

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *courseId;

@property (nonatomic, copy) NSString *coursewareId;

@property (nonatomic, copy) NSString *depthType;

@property (nonatomic, copy) NSString *cwId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *isDownload;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy) NSString *downloadPath;

@end
