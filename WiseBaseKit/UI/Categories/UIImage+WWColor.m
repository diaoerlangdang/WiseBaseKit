//
//  UIImage+WWColor.m
//  WiseBaseKit
//
//  Created by wuruizhi on 2016/10/24.
//  Copyright © 2016年 wuruizhi. All rights reserved.
//

#import "UIImage+WWColor.h"

@implementation UIImage (WWColor)

/**
 *  颜色转为图片，大小为1*1
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGSize size = CGSizeMake(1.0f, 1.0f);
    return [UIImage imageWithColor:color withSize:size];
}

/**
 *  颜色转为图片
 *
 *  @param color 图片颜色
 *  @param size  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
