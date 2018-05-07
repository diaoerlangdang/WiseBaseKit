//
//  UILabel+WWCreate.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2018/3/7.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WWCreate)

/**
 label 快速创建
 
 @param textColor 字体颜色
 @param font 字体
 @return UILabel
 */
+ (UILabel *)labelWithTextColor:(UIColor *)textColor font:(UIFont *)font;

@end
