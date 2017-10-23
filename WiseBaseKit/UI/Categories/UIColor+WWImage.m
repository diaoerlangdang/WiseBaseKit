//
//  UIColor+WWImage.m
//  WiseBaseKit
//
//  Created by wuruizhi on 2016/10/24.
//  Copyright © 2016年 wuruizhi. All rights reserved.
//

#import "UIColor+WWImage.h"

@implementation UIColor (WWImage)

/**
 *  图片转为颜色
 *
 *  @param image 图片
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithImage:(UIImage *)image
{
    return [UIColor colorWithPatternImage:image];
}




@end
