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

//placeholder 颜色
@property (nonatomic, strong) UIColor *placeholderColor;

@end
