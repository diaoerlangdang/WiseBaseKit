//
//  UIImage+WWStretch.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "UIImage+WWStretch.h"

@implementation UIImage (WWStretch)

/**
 *  图片中间1*1拉伸
 *
 *  @param imageName  图片名
 *
 *  @return 拉伸的图片
 */
+ (UIImage *)imageStretchWithName:(NSString *)imageName
{
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 设置端盖的值
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    
    // 设置端盖的值
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    // 设置拉伸的模式
    UIImageResizingMode mode = UIImageResizingModeStretch;
    
    // 拉伸图片
    return [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
}


/**
 *  图片中间1*1拉伸
 *
 *  @return 拉伸后的图片
 */
- (UIImage *)strechImage
{
    // 设置端盖的值
    CGFloat top = self.size.height * 0.5;
    CGFloat left = self.size.width * 0.5;
    CGFloat bottom = self.size.height * 0.5;
    CGFloat right = self.size.width * 0.5;
    
    // 设置端盖的值
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    // 设置拉伸的模式
    UIImageResizingMode mode = UIImageResizingModeStretch;
    
    // 拉伸图片
    return [self resizableImageWithCapInsets:edgeInsets resizingMode:mode];
}

@end
