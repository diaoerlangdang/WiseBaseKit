//
//  WWTextView.h
//  OASystem
//
//  Created by wuruizhi on 2018/5/2.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/** 限制最大长度 */
@property (nonatomic, assign) NSUInteger maxLength;

@end
