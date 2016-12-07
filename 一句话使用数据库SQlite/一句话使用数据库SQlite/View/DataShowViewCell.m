//
//  DataShowViewCell.m
//  一句话使用数据库SQlite
//
//  Created by 周鹏钜 on 16/12/7.
//  Copyright © 2016年 周鹏钜. All rights reserved.
//

#import "DataShowViewCell.h"

@interface DataShowViewCell ()

@property (nonatomic, weak) UILabel *labelUid;

@property (nonatomic, weak) UILabel *labelCourseId;

@property (nonatomic, weak) UILabel *labelCoursewareId;

@property (nonatomic, weak) UILabel *labelDepthType;

@property (nonatomic, weak) UILabel *labelCwId;

@property (nonatomic, weak) UILabel *labelName;

@property (nonatomic, weak) UILabel *labelIsDownload;

@property (nonatomic, weak) UILabel *labelImgUrl;

@property (nonatomic, weak) UILabel *labelDownloadPath;

@end

@implementation DataShowViewCell

-(void)setModelDB:(PJLocalDataManagerModel *)modelDB {

    _modelDB = modelDB;
    
    self.labelUid.text = modelDB.uid;
    
    self.labelCourseId.text = modelDB.courseId;
    
    self.labelCoursewareId.text = modelDB.coursewareId;
    
    self.labelDepthType.text = modelDB.depthType;
    
    self.labelCwId.text = modelDB.cwId;
    
    self.labelName.text = modelDB.name;
    
    self.labelIsDownload.text = modelDB.isDownload;
    
    self.labelImgUrl.text = modelDB.imgUrl;
    
    self.labelDownloadPath.text = modelDB.downloadPath;
}

- (void)creatContainerView {
    
    // 0. cell线
    UIView *viewLineMiddle = [[UIView alloc] init];
    [self.contentView addSubview:viewLineMiddle];
    
    viewLineMiddle.backgroundColor = kGlobalPlaceholderLine;
    
    [viewLineMiddle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(0.5, 60));
    }];

    // 1. uid
    UILabel *labelUidName = [[UILabel alloc] init];
    [self.contentView addSubview:labelUidName];
    
    labelUidName.text = @"Uid:";
    labelUidName.textColor = kRGBColor(0x333333);
    labelUidName.font = [UIFont systemFontOfSize:14];
    labelUidName.textAlignment = NSTextAlignmentRight;
    
    [labelUidName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelUid = [[UILabel alloc] init];
    self.labelUid = labelUid;
    [self.contentView addSubview:labelUid];
    
    labelUid.textColor = kRGBColor(0x999999);
    labelUid.font = [UIFont systemFontOfSize:14];
    
    labelUid.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelUid mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelUidName.mas_centerY);
        make.left.mas_equalTo(labelUidName.mas_right).offset(10);
        make.right.mas_equalTo(viewLineMiddle.mas_left).offset(-5);
    }];
    
    // 2. CourseId
    UILabel *labelCourseIdName = [[UILabel alloc] init];
    [self.contentView addSubview:labelCourseIdName];
    
    labelCourseIdName.text = @"CourseId:";
    labelCourseIdName.textColor = kRGBColor(0x333333);
    labelCourseIdName.font = [UIFont systemFontOfSize:14];
    labelCourseIdName.textAlignment = NSTextAlignmentRight;
    
    [labelCourseIdName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelUidName.mas_centerY);
        make.left.mas_equalTo(viewLineMiddle.mas_right);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelCourseId = [[UILabel alloc] init];
    self.labelCourseId = labelCourseId;
    [self.contentView addSubview:labelCourseId];
    
    labelCourseId.textColor = kRGBColor(0x999999);
    labelCourseId.font = [UIFont systemFontOfSize:14];
    
    labelCourseId.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelCourseId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelCourseIdName.mas_centerY);
        make.left.mas_equalTo(labelCourseIdName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];

    // 3. CoursewareId
    UILabel *labelCoursewareIdName = [[UILabel alloc] init];
    [self.contentView addSubview:labelCoursewareIdName];
    
    labelCoursewareIdName.text = @"CoursewareId:";
    labelCoursewareIdName.textColor = kRGBColor(0x333333);
    labelCoursewareIdName.font = [UIFont systemFontOfSize:14];
    labelCoursewareIdName.textAlignment = NSTextAlignmentRight;
    
    [labelCoursewareIdName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelUid.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelCoursewareId = [[UILabel alloc] init];
    self.labelCoursewareId = labelCoursewareId;
    [self.contentView addSubview:labelCoursewareId];
    
    labelCoursewareId.textColor = kRGBColor(0x999999);
    labelCoursewareId.font = [UIFont systemFontOfSize:14];
    
    labelCoursewareId.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelCoursewareId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelCoursewareIdName.mas_centerY);
        make.left.mas_equalTo(labelCoursewareIdName.mas_right).offset(10);
        make.right.mas_equalTo(viewLineMiddle.mas_left).offset(-5);
    }];
    
    // 4. DepthType
    UILabel *labelDepthTypeName = [[UILabel alloc] init];
    [self.contentView addSubview:labelDepthTypeName];
    
    labelDepthTypeName.text = @"DepthType:";
    labelDepthTypeName.textColor = kRGBColor(0x333333);
    labelDepthTypeName.font = [UIFont systemFontOfSize:14];
    labelDepthTypeName.textAlignment = NSTextAlignmentRight;
    
    [labelDepthTypeName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelCoursewareId.mas_centerY);
        make.left.mas_equalTo(viewLineMiddle.mas_right);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelDepthType = [[UILabel alloc] init];
    self.labelDepthType = labelDepthType;
    [self.contentView addSubview:labelDepthType];
    
    labelDepthType.textColor = kRGBColor(0x999999);
    labelDepthType.font = [UIFont systemFontOfSize:14];
    
    labelDepthType.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelDepthType mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelDepthTypeName.mas_centerY);
        make.left.mas_equalTo(labelDepthTypeName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];

    // 5. Name
    UILabel *labelNameName = [[UILabel alloc] init];
    [self.contentView addSubview:labelNameName];
    
    labelNameName.text = @"Name:";
    labelNameName.textColor = kRGBColor(0x333333);
    labelNameName.font = [UIFont systemFontOfSize:14];
    labelNameName.textAlignment = NSTextAlignmentRight;
    
    [labelNameName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelCoursewareId.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelName = [[UILabel alloc] init];
    self.labelName = labelName;
    [self.contentView addSubview:labelName];
    
    labelName.textColor = kRGBColor(0x999999);
    labelName.font = [UIFont systemFontOfSize:14];
    
    labelName.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelNameName.mas_centerY);
        make.left.mas_equalTo(labelNameName.mas_right).offset(10);
        make.right.mas_equalTo(viewLineMiddle.mas_left).offset(-5);
    }];
    
    // 6. IsDownload
    UILabel *labelIsDownloadName = [[UILabel alloc] init];
    [self.contentView addSubview:labelIsDownloadName];
    
    labelIsDownloadName.text = @"IsDownload:";
    labelIsDownloadName.textColor = kRGBColor(0x333333);
    labelIsDownloadName.font = [UIFont systemFontOfSize:14];
    labelIsDownloadName.textAlignment = NSTextAlignmentRight;
    
    [labelIsDownloadName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelName.mas_centerY);
        make.left.mas_equalTo(viewLineMiddle.mas_right);
        make.width.mas_equalTo(@95);
    }];
    
    UILabel *labelIsDownload = [[UILabel alloc] init];
    self.labelIsDownload = labelIsDownload;
    [self.contentView addSubview:labelIsDownload];
    
    labelIsDownload.textColor = kRGBColor(0x999999);
    labelIsDownload.font = [UIFont systemFontOfSize:14];
    
    labelIsDownload.preferredMaxLayoutWidth = WIDTH/4.0;
    [labelIsDownload mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelIsDownloadName.mas_centerY);
        make.left.mas_equalTo(labelIsDownloadName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];
    
    
    // 9. labelCwId
    UILabel *labelCwIdName = [[UILabel alloc] init];
    [self.contentView addSubview:labelCwIdName];
    
    labelCwIdName.text = @"CwId:";
    labelCwIdName.textColor = kRGBColor(0x333333);
    labelCwIdName.font = [UIFont systemFontOfSize:14];
    labelCwIdName.textAlignment = NSTextAlignmentRight;
    
    [labelCwIdName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelName.mas_bottom).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.width.mas_equalTo(@40);
    }];
    
    UILabel *labelCwId = [[UILabel alloc] init];
    self.labelCwId = labelCwId;
    [self.contentView addSubview:labelCwId];
    
    labelCwId.textColor = kRGBColor(0x999999);
    labelCwId.font = [UIFont systemFontOfSize:14];
    
    labelCwId.preferredMaxLayoutWidth = WIDTH - 20;
    [labelCwId mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelCwIdName.mas_centerY);
        make.left.mas_equalTo(labelCwIdName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];

    // 7. ImgUrl
    UILabel *labelImgUrlName = [[UILabel alloc] init];
    [self.contentView addSubview:labelImgUrlName];
    
    labelImgUrlName.text = @"ImgUrl:";
    labelImgUrlName.textColor = kRGBColor(0x333333);
    labelImgUrlName.font = [UIFont systemFontOfSize:14];
    labelImgUrlName.textAlignment = NSTextAlignmentRight;
    
    [labelImgUrlName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelCwIdName.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.width.mas_equalTo(@55);
    }];
    
    UILabel *labelImgUrl = [[UILabel alloc] init];
    self.labelImgUrl = labelImgUrl;
    [self.contentView addSubview:labelImgUrl];
    
    labelImgUrl.textColor = kRGBColor(0x999999);
    labelImgUrl.font = [UIFont systemFontOfSize:10];
    
    labelImgUrl.preferredMaxLayoutWidth = WIDTH - 90;
    [labelImgUrl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelImgUrlName.mas_centerY);
        make.left.mas_equalTo(labelImgUrlName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];
    
    // 8. DownloadPath
    UILabel *labelIsDownloadPathName = [[UILabel alloc] init];
    [self.contentView addSubview:labelIsDownloadPathName];
    
    labelIsDownloadPathName.text = @"DownloadPath:";
    labelIsDownloadPathName.textColor = kRGBColor(0x333333);
    labelIsDownloadPathName.font = [UIFont systemFontOfSize:14];
    labelIsDownloadPathName.textAlignment = NSTextAlignmentRight;
    
    [labelIsDownloadPathName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(labelImgUrlName.mas_bottom).offset(30);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.width.mas_equalTo(@100);
    }];
    
    UILabel *labelDownloadPath = [[UILabel alloc] init];
    self.labelDownloadPath = labelDownloadPath;
    [self.contentView addSubview:labelDownloadPath];
    
    labelDownloadPath.numberOfLines = 0;
    labelDownloadPath.textColor = kRGBColor(0x999999);
    labelDownloadPath.font = [UIFont systemFontOfSize:9];
    
    labelDownloadPath.preferredMaxLayoutWidth = WIDTH - 120;
    [labelDownloadPath mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(labelIsDownloadPathName.mas_centerY);
        make.left.mas_equalTo(labelIsDownloadPathName.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-5);
    }];
    
    // 10. cell线
    UIView *viewLine = [[UIView alloc] init];
    [self.contentView addSubview:viewLine];
    
    viewLine.backgroundColor = kRGBColor(0xdddddd);
    
    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.equalTo(@0.5);
    }];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        //0. 自身的属性设置
        self.backgroundColor = [UIColor whiteColor];
        
        //1. 创建控件
        [self creatContainerView];
    }
    return self;
}

@end
