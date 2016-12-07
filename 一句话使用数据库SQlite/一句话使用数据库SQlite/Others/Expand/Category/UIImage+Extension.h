//
//  UIImage+Extension.h
//  ZhenHuiWan
//
//  Created by 周鹏钜 on 15/11/9.
//  Copyright © 2015年 周鹏钜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

//返回一张可以自由拉伸的图片
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

//使用传入的颜色返回一张此颜色的照片
+ (UIImage *)imageWithColor:(UIColor *)color;

//图片压缩到指定大小
+ (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize andSourceImage:(UIImage *)sourceImage;

+ (UIImage *)fixOrientation:(UIImage *)aImage;

@end
