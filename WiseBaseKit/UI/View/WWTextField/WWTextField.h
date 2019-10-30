//
//  WWTextField.h
//  OASystem
//
//  Created by wuruizhi on 2018/5/2.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWTextField : UITextField

/** 限制最大长度 */
@property(nonatomic, assign) NSUInteger maxLength;

//placeholder 颜色, 建议设置完placeholder后使用
@property (nonatomic, strong) UIColor *placeholderColor;

//placeholder 字体, 建议设置完placeholder后使用
@property (nonatomic, strong) UIFont *placeholderFont;


/// 设置placeHolder 信息， 若颜色与字体都需要更改建议使用该方法
/// @param placeHolder placeHolder信息
/// @param color placeHolder 颜色
/// @param font placeHolder 字体
- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)color font:(UIFont *)font;

@end
