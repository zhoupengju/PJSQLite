//
//  PJViewController.m
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/5.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "PJViewController.h"
#import "DataShowViewController.h"
#import "PJLocalDataManagerModel.h"

#define SqliteName @"hentane"
#define UserInforName @"zhoupengju"

@interface PJViewController ()

@property (nonatomic, weak) UIView *viewGreen;

@property (nonatomic, weak) UIView *viewOrange;

@property (nonatomic, weak) UIView *viewRed;

@property (nonatomic, weak) UITextField *textFiledInsertId;

@property (nonatomic, weak) UITextField *textFiledQueryId;
@property (nonatomic, weak) UITextField *textFiledOrangeUser_name;

@property (nonatomic, weak) UITextField *textFiledDeleteId;

@property (nonatomic, weak) UITextField *textFiledUpdateId;

@end

@implementation PJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    
    [self createContainterView];
    
    // 数据库初始化
    [PJLocalDataInstanceManager initDBTable];
    
//    [PJLocalDataManager createDataBaseWithName:SqliteName andUserInfoField:UserInforName];
//    
//    [PJLocalDataInstanceManager openDB];
    
//    PJLocalDataManagerModel *model = [[PJLocalDataManagerModel alloc] init];
//    model.uid = @"10013";
//    model.courseId = @"1117";
//    model.coursewareId = @"13823";
//    model.depthType = @"3";
//    model.cwId = @"5139A5E5F3FE2EA29C33DC5901307461";
//    model.name = @"yueyue";
//    model.isDownload = @"2";
//    [PJLocalDataInstanceManager initDBTable];
//    [PJLocalDataInstanceManager insertCourseware:model];
//    [PJLocalDataInstanceManager initDBTable];
    
//    PJLog(@"%@", [PJLocalDataInstanceManager queryIsDownloadStatus:model]);
//    PJLog(@"%d", [PJLocalDataInstanceManager insertCourse:model]);
}


- (void)buttonInsertClick {
    
    PJLog(@"");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i<10; i++) {

            PJLocalDataManagerModel *model = [[PJLocalDataManagerModel alloc] init];
            model.uid = @"100123"; //[NSString stringWithFormat:@"1001%d", i];
            model.courseId = @"1117";
            model.coursewareId = [NSString stringWithFormat:@"1382%d", i];
            model.depthType = @"3";
            model.cwId = @"5139A5E5F3FE2EA29C33DC5901307461";
            model.name = @"yueyue";
            model.isDownload = @"2";
            model.imgUrl = @"http://img.ileup.com/goods/20161122093409_771.jpg";
            model.downloadPath = @"/Users/zhoupengju/Library/Developer/CoreSimulator/Devices/4009B79B-9CEA-4CB1-8BD7-E4C7A75DF245/data/Containers/Data/Application/0016FF4D-8047-44B1-8E24-F689A5E1BCB6/Library/Caches/10011B86BE01DEE13710E9C33DC59013074611117.pcm";
            [arr addObject:model];
        }
        [PJLocalDataInstanceManager insertCourse:arr];
    });
}

- (void)buttonQueryClick {
    
    DataShowViewController *vc = [[DataShowViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonDeleteClick {
    
    [PJLocalDataInstanceManager deleteStateWithCoursewareId:self.textFiledDeleteId.text];
}

- (void)buttonUpdateClick {
    
    [PJLocalDataInstanceManager updateDownloadStateWithCoursewareId:self.textFiledUpdateId.text];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)createContainterView {

    [self createOneView];

    [self createTwoView];

    [self createThreeView];
    
    [self createUpdateView];
}

// 插入
- (void)createOneView {
    
    UILabel *labelInsertTitle = [[UILabel alloc] init];
    [self.view addSubview:labelInsertTitle];
    
    labelInsertTitle.text = @"插入数据";
    labelInsertTitle.font = [UIFont systemFontOfSize:14];
    labelInsertTitle.textColor = [UIColor whiteColor];
    labelInsertTitle.backgroundColor = kRGBColor(0x0bef91);
    labelInsertTitle.textAlignment = NSTextAlignmentCenter;
    
    [labelInsertTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view.mas_top).offset(13);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@28);
    }];
    
    UILabel *labelInsertID = [[UILabel alloc] init];
    [self.view addSubview:labelInsertID];

    labelInsertID.text = @"用户ID: ";
    labelInsertID.textColor = [UIColor whiteColor];
    labelInsertID.font = [UIFont systemFontOfSize:12];
    labelInsertID.textAlignment = NSTextAlignmentCenter;
    labelInsertID.backgroundColor = [UIColor orangeColor];

    [labelInsertID mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(labelInsertTitle.mas_bottom).offset(0.8);
        make.left.right.mas_equalTo(labelInsertTitle);
        make.height.mas_equalTo(@(25));
    }];
    
    UIButton *buttonInsert = [[UIButton alloc] init];
    [self.view addSubview:buttonInsert];
    
    [buttonInsert setBackgroundImage:[UIImage resizedImageWithName:@"UITextFieldBg"] forState:UIControlStateNormal];
    
    [buttonInsert mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelInsertID.mas_centerY);
        make.left.mas_equalTo(labelInsertID.mas_right).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-130);
        make.height.mas_equalTo(@28);
    }];
    
    UITextField *textFiledInsertId = [[UITextField alloc] init];
    [self.view addSubview:textFiledInsertId];
    self.textFiledInsertId = textFiledInsertId;

    [textFiledInsertId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.right.mas_equalTo(buttonInsert);
        make.left.mas_equalTo(buttonInsert.mas_left).offset(15);
    }];
    
    UIButton *buttonInsertShure = [[UIButton alloc] init];
    [self.view addSubview:buttonInsertShure];
    
    [buttonInsertShure setBackgroundImage:[UIImage imageNamed:@"meNavbg"] forState:UIControlStateNormal];
    buttonInsertShure.layer.cornerRadius = 7;
    buttonInsertShure.layer.masksToBounds = YES;
    buttonInsertShure.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonInsertShure setTitle:@"确认插入" forState:UIControlStateNormal];
    [buttonInsertShure addTarget:self action:@selector(buttonInsertClick) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonInsertShure mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelInsertID.mas_centerY);
        make.left.mas_equalTo(buttonInsert.mas_right).offset(15);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(@28);
    }];
}

// 查询
- (void)createTwoView {

    UILabel *labelQueryTitle = [[UILabel alloc] init];
    [self.view addSubview:labelQueryTitle];
    
    labelQueryTitle.text = @"查询数据";
    labelQueryTitle.font = [UIFont systemFontOfSize:14];
    labelQueryTitle.textColor = [UIColor whiteColor];
    labelQueryTitle.backgroundColor = kRGBColor(0x0bef91);
    labelQueryTitle.textAlignment = NSTextAlignmentCenter;
    
    [labelQueryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.textFiledInsertId.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@28);
    }];
    
    UILabel *labelQueryID = [[UILabel alloc] init];
    [self.view addSubview:labelQueryID];
    
    labelQueryID.text = @"查询ID: ";
    labelQueryID.textColor = [UIColor whiteColor];
    labelQueryID.font = [UIFont systemFontOfSize:12];
    labelQueryID.textAlignment = NSTextAlignmentCenter;
    labelQueryID.backgroundColor = [UIColor orangeColor];
    
    [labelQueryID mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelQueryTitle.mas_bottom).offset(0.8);
        make.left.right.mas_equalTo(labelQueryTitle);
        make.height.mas_equalTo(@(25));
    }];
    
    UIButton *buttonQuery = [[UIButton alloc] init];
    [self.view addSubview:buttonQuery];
    
    [buttonQuery setBackgroundImage:[UIImage resizedImageWithName:@"UITextFieldBg"] forState:UIControlStateNormal];
    
    [buttonQuery mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(labelQueryID.mas_right).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-130);
        make.height.mas_equalTo(@28);
    }];
    
    UITextField *textFiledQueryId = [[UITextField alloc] init];
    [self.view addSubview:textFiledQueryId];
    self.textFiledQueryId = textFiledQueryId;
    
    [textFiledQueryId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.right.mas_equalTo(buttonQuery);
        make.left.mas_equalTo(buttonQuery.mas_left).offset(15);
    }];
    
    
    UIButton *buttonQueryShure = [[UIButton alloc] init];
    [self.view addSubview:buttonQueryShure];
    
    [buttonQueryShure setBackgroundImage:[UIImage imageNamed:@"meNavbg"] forState:UIControlStateNormal];
    buttonQueryShure.layer.cornerRadius = 7;
    buttonQueryShure.layer.masksToBounds = YES;
    buttonQueryShure.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonQueryShure setTitle:@"确认查询" forState:UIControlStateNormal];
    [buttonQueryShure addTarget:self action:@selector(buttonQueryClick) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonQueryShure mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(buttonQuery.mas_right).offset(15);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(@28);
    }];
}

// 删除
- (void)createThreeView {

    UILabel *labelQueryTitle = [[UILabel alloc] init];
    [self.view addSubview:labelQueryTitle];
    
    labelQueryTitle.text = @"删除数据";
    labelQueryTitle.font = [UIFont systemFontOfSize:14];
    labelQueryTitle.textColor = [UIColor whiteColor];
    labelQueryTitle.backgroundColor = kRGBColor(0x0bef91);
    labelQueryTitle.textAlignment = NSTextAlignmentCenter;
    
    [labelQueryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.textFiledQueryId.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@28);
    }];
    
    UILabel *labelQueryID = [[UILabel alloc] init];
    [self.view addSubview:labelQueryID];
    
    labelQueryID.text = @"coursewareId: ";
    labelQueryID.textColor = [UIColor whiteColor];
    labelQueryID.font = [UIFont systemFontOfSize:12];
    labelQueryID.textAlignment = NSTextAlignmentCenter;
    labelQueryID.backgroundColor = [UIColor orangeColor];
    
    [labelQueryID mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelQueryTitle.mas_bottom).offset(0.8);
        make.left.right.mas_equalTo(labelQueryTitle);
        make.height.mas_equalTo(@(25));
    }];
    
    UIButton *buttonQuery = [[UIButton alloc] init];
    [self.view addSubview:buttonQuery];
    
    [buttonQuery setBackgroundImage:[UIImage resizedImageWithName:@"UITextFieldBg"] forState:UIControlStateNormal];
    
    [buttonQuery mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(labelQueryID.mas_right).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-130);
        make.height.mas_equalTo(@28);
    }];
    
    UITextField *textFiledDeleteId = [[UITextField alloc] init];
    [self.view addSubview:textFiledDeleteId];
    self.textFiledDeleteId = textFiledDeleteId;
    
    [textFiledDeleteId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.right.mas_equalTo(buttonQuery);
        make.left.mas_equalTo(buttonQuery.mas_left).offset(15);
    }];
    
    
    UIButton *buttonQueryShure = [[UIButton alloc] init];
    [self.view addSubview:buttonQueryShure];
    
    [buttonQueryShure setBackgroundImage:[UIImage imageNamed:@"meNavbg"] forState:UIControlStateNormal];
    buttonQueryShure.layer.cornerRadius = 7;
    buttonQueryShure.layer.masksToBounds = YES;
    buttonQueryShure.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonQueryShure setTitle:@"确认删除" forState:UIControlStateNormal];
    [buttonQueryShure addTarget:self action:@selector(buttonDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonQueryShure mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(buttonQuery.mas_right).offset(15);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(@28);
    }];
}

// 更新
- (void)createUpdateView {
    
    UILabel *labelQueryTitle = [[UILabel alloc] init];
    [self.view addSubview:labelQueryTitle];
    
    labelQueryTitle.text = @"更新数据";
    labelQueryTitle.font = [UIFont systemFontOfSize:14];
    labelQueryTitle.textColor = [UIColor whiteColor];
    labelQueryTitle.backgroundColor = kRGBColor(0x0bef91);
    labelQueryTitle.textAlignment = NSTextAlignmentCenter;
    
    [labelQueryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.textFiledDeleteId.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(@90);
        make.height.mas_equalTo(@28);
    }];
    
    UILabel *labelQueryID = [[UILabel alloc] init];
    [self.view addSubview:labelQueryID];
    
    labelQueryID.text = @"coursewareId: ";
    labelQueryID.textColor = [UIColor whiteColor];
    labelQueryID.font = [UIFont systemFontOfSize:12];
    labelQueryID.textAlignment = NSTextAlignmentCenter;
    labelQueryID.backgroundColor = [UIColor orangeColor];
    
    [labelQueryID mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelQueryTitle.mas_bottom).offset(0.8);
        make.left.right.mas_equalTo(labelQueryTitle);
        make.height.mas_equalTo(@(25));
    }];
    
    UIButton *buttonQuery = [[UIButton alloc] init];
    [self.view addSubview:buttonQuery];
    
    [buttonQuery setBackgroundImage:[UIImage resizedImageWithName:@"UITextFieldBg"] forState:UIControlStateNormal];
    
    [buttonQuery mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(labelQueryID.mas_right).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-130);
        make.height.mas_equalTo(@28);
    }];
    
    UITextField *textFiledUpdateId = [[UITextField alloc] init];
    [self.view addSubview:textFiledUpdateId];
    self.textFiledUpdateId = textFiledUpdateId;
    
    [textFiledUpdateId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.height.right.mas_equalTo(buttonQuery);
        make.left.mas_equalTo(buttonQuery.mas_left).offset(15);
    }];
    
    
    UIButton *buttonQueryShure = [[UIButton alloc] init];
    [self.view addSubview:buttonQueryShure];
    
    [buttonQueryShure setBackgroundImage:[UIImage imageNamed:@"meNavbg"] forState:UIControlStateNormal];
    buttonQueryShure.layer.cornerRadius = 7;
    buttonQueryShure.layer.masksToBounds = YES;
    buttonQueryShure.titleLabel.font = [UIFont systemFontOfSize:14];
    [buttonQueryShure setTitle:@"确认更新" forState:UIControlStateNormal];
    [buttonQueryShure addTarget:self action:@selector(buttonUpdateClick) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonQueryShure mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelQueryID.mas_centerY);
        make.left.mas_equalTo(buttonQuery.mas_right).offset(15);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(@28);
    }];
}

- (void)setNavBar {
    
    self.title = @"数据库操作";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = kGlobalBg;
    
//    UIButton *btnNav = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    UIBarButtonItem *itemNav = [[UIBarButtonItem alloc] initWithCustomView:btnNav];
//    self.navigationItem.rightBarButtonItem = itemNav;
//    
//    [btnNav addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

@end
