//
//  UIImage+WWColor.h
//  WiseBaseKit
//
//  Created by wuruizhi on 2016/10/24.
//  Copyright © 2016年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WWColor)

/**
 *  颜色转为图片，大小为1*1
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  颜色转为图片
 *
 *  @param color 图片颜色
 *  @param size  图片尺寸
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGSize)size;





@end
