//
//  UIView+WWExtend.h
//  WiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WWExtend)

/**
 *  添加单击事件
 *
 *  @param target      target
 *  @param selector    执行函数
 */
- (void)addTapAction:(id)target selector:(SEL)selector;

/**
 *  添加长按事件
 *
 *  @param target      target
 *  @param selector    执行函数
 */
- (void)addLongPressAction:(id)target selector:(SEL)selector;


/**
 *  所在控制器
 *
 *  @return 所在控制器
 */
- (UIViewController *)viewController;


/**
 *  设置圆角
 *
 *  @param cornerRadius 圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;


/**
 *  截图
 *
 *  @return 基于位图返回UIImage
 */
- (UIImage *)screenShotImage;


@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

//center
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

//left top right bottom
@property (nonatomic, readonly) CGFloat left;
@property (nonatomic, readonly) CGFloat top;
@property (nonatomic, readonly) CGFloat right;
@property (nonatomic, readonly) CGFloat bottom;

- (void)setViewLeft:(CGFloat)x;
- (void)setViewTop:(CGFloat)y;
- (void)setViewWidth:(CGFloat)width;
- (void)setViewHeight:(CGFloat)height;

@end
