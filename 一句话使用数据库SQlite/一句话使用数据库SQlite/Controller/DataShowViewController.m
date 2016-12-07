//
//  DataShowViewController.m
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/5.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "DataShowViewCell.h"
#import "DataShowViewController.h"

static NSString *ID = @"DataShowViewCell";

@interface DataShowViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation DataShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    
    [self loadDBData];
    
    [self setTableView];
}

#pragma mark - 创建TableView
- (void)setTableView {

    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.rowHeight = 230;
    
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [tableview registerClass:[DataShowViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DataShowViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.modelDB = self.arrayData[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 加载数据库数据
- (void)loadDBData {

    self.arrayData = [PJLocalDataInstanceManager queryAllData_DB];
}

- (void)setNavBar {
    
    self.title = @"Data List";
    
    self.view.backgroundColor = kRGBColor(0xdddddd);
}

@end
