//
//  DataShowViewCell.h
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/7.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJLocalDataManagerModel.h"

@interface DataShowViewCell : UITableViewCell

@property (nonatomic, strong) PJLocalDataManagerModel *modelDB;

@end
