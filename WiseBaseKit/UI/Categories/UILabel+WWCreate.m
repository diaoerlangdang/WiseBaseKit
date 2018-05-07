//
//  UILabel+WWCreate.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2018/3/7.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import "UILabel+WWCreate.h"

@implementation UILabel (WWCreate)


/**
 label 快速创建

 @param textColor 字体颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [UILabel new];
    label.textColor = textColor;
    label.font = font;
    
    return label;
}

@end
