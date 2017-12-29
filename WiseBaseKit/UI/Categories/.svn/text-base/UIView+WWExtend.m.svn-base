//
//  UIView+WWExtend.m
//  WiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "UIView+WWExtend.h"

@implementation UIView (WWExtend)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}


-(void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY {
    return self.center.y;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setViewLeft:(CGFloat)x
{
    self.frame = CGRectMake(x, self.top, self.width, self.height);
}

- (void)setViewTop:(CGFloat)y
{
    self.frame = CGRectMake(self.left, y, self.width, self.height);
}

- (void)setViewWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (void)setViewHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}


/**
 *  截图
 *
 *  @return 基于位图返回UIImage
 */
- (UIImage *)screenShotImage{
    if (!self) {
        return nil;
    }
    
    CGSize resultImageSize = CGSizeMake(self.width, self.height);;
    
    UIGraphicsBeginImageContextWithOptions(resultImageSize, YES, 0);
    [[self layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
    
}

/**
 *  添加单击事件
 *
 *  @param target      target
 *  @param selector    执行函数
 */
- (void)addTapAction:(id)target selector:(SEL)selector
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapGestureRecognizer];
}


/**
 *  添加长按事件
 *
 *  @param target      target
 *  @param selector    执行函数
 */
- (void)addLongPressAction:(id)target selector:(SEL)selector
{
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:recognizer];
}


/**
 *  所在控制器
 *
 *  @return 所在控制器
 */
- (UIViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/**
 *  设置圆角
 *
 *  @param cornerRadius 圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

@end
