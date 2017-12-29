//
//  UINavigationBar+WWBackgroundColor.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/12/7.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "UINavigationBar+WWBackgroundColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (WWBackgroundColor)

static char overNavBarViewKey;

//原图片
static char oldNavBarImageKey;


- (UIView *)overNavBarView
{
    
    return objc_getAssociatedObject(self, &overNavBarViewKey);
    
}



- (void)setOverNavBarView:(UIView *)overNavBarView
{
    
    objc_setAssociatedObject(self, &overNavBarViewKey, overNavBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIImage *)oldNavBarImage
{
    
    return objc_getAssociatedObject(self, &oldNavBarImageKey);
    
}



- (void)setOldNavBarImage:(UIImage *)oldNavBarImage
{
    
    objc_setAssociatedObject(self, &oldNavBarImageKey, oldNavBarImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}



/**
 设置背景颜色
 
 @param backgroundColor 背景颜色
 */
- (void)ww_setBackgroundColor:(UIColor *)backgroundColor
{
    
    if (!self.overNavBarView) {
        
        self.oldNavBarImage = [self backgroundImageForBarMetrics:UIBarMetricsDefault];
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overNavBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + WW_STATUS_BAR_HEIGHT)];
        
        self.overNavBarView.userInteractionEnabled = NO;
        
        self.overNavBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        [[self.subviews firstObject] insertSubview:self.overNavBarView atIndex:0];
        
    }
    
    self.overNavBarView.backgroundColor = backgroundColor;
    
}


/**
 设置a值
 
 @param alpha a值
 */
- (void)ww_setAlpha:(CGFloat)alpha
{
    
    if (!self.overNavBarView) {

        UIColor *color = [UIColor whiteColor];
        if ([self backgroundImageForBarMetrics:UIBarMetricsDefault] != nil) {
            color = [UIColor colorWithImage:[self backgroundImageForBarMetrics:UIBarMetricsDefault]];
        }
        [self ww_setBackgroundColor:color];
    }

    self.overNavBarView.alpha = alpha;
    
//    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
//
//        view.alpha = alpha;
//
//    }];
//
//
//
//    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
//
//        view.alpha = alpha;
//
//    }];
//
//
//
//    UIView *titleView = [self valueForKey:@"_titleView"];
//
//    titleView.alpha = alpha;
//
//    //    when viewController first load, the titleView maybe nil
//
//    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
//
//        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
//
//            obj.alpha = alpha;
//
//            *stop = YES;
//
//        }
//
//    }];

}

/**
 恢复之前的设置
 */
- (void)ww_recovery
{
    
    [self setBackgroundImage:self.oldNavBarImage forBarMetrics:UIBarMetricsDefault];
    
    [self.overNavBarView removeFromSuperview];
    
    self.overNavBarView = nil;
    
}

@end
