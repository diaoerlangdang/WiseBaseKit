//
//  WWBaseViewController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "UIView+WWExtend.h"
#import "UIViewController+WWFragment.h"

typedef enum : NSUInteger {
    WWBaseKitShowType_Normal,  //正常
    WWBaseKitShowType_NoData,  //无数据
    WWBaseKitShowType_Error,   //错误
} WWBaseKitShowType;

@protocol WWViewControllerDelegate <NSObject>

/**
 *  界面返回代理 模态弹出时使用；方便操作父controller的数据
 *
 *  @param vc           返回的视图
 *  @param isSuccess    是否成功
 *  @param data         返回的数据
 */
- (void)controller:(UIViewController *)vc back:(BOOL)isSuccess data:(NSDictionary *)data;

@end

@interface WWBaseViewController : UIViewController<WWViewControllerDelegate, UIGestureRecognizerDelegate>


/**
 返回按钮默认图片
 */
@property (class, nonatomic, strong) UIImage *defaultReturnImage;


/**
 背景默认颜色
 */
@property (class, nonatomic, strong) UIColor *defaultBgColor;


/**
 默认什么都没有显示的图片
 */
@property (class, nonatomic, strong) UIImage *defaultNoDataImage;


/**
 默认什么都没有显示提示语
 */
@property (class, nonatomic, strong) NSString *defaultnoDataTip;


/**
 默认错误显示的图片
 */
@property (class, nonatomic, strong) UIImage *defaultErrorImage;


/**
 默认错误显示提示语
 */
@property (class, nonatomic, strong) NSString *defaultErrorTip;


/**
 默认顶部图片
 */
@property (class, nonatomic, strong) UIImage *defaultTopImage;


/**
 默认导航栏颜色
 */
@property (class, nonatomic, assign) UIStatusBarStyle defaultStatusBarStyle;

/**
 默认是否支持滑动返回，默认支持
 */
@property (class, nonatomic, assign) BOOL defaultSlideReturn;

/**
 * 当没有数据或错误时显示提示图，默认隐藏
 */
@property (nonatomic, strong) UIImageView *tipImageView;

/**
 * 当没有数据或错误时显示的友好提示语，默认隐藏
 */
@property (nonatomic, strong) UILabel *tipLabel;

/** 什么都没有显示的图片 */
@property (nonatomic, strong) NSString *noDataImageName;

/** 什么都没有提示的文字*/
@property (nonatomic, strong) NSString *noDataTip;

/** 错误显示的图片 */
@property (nonatomic, strong) NSString *errorImageName;

/** 错误提示的文字*/
@property (nonatomic, strong) NSString *errorTip;


/** 顶部图片 */
@property (nonatomic, strong) UIImageView *topImageView;

/** 顶部图片名*/
@property (nonatomic, strong) NSString *topImageName;

/** 提示图片与信息，默认不显示 为WWBaseKitShowType_Normal */
@property (nonatomic, assign) WWBaseKitShowType showType;

/**  返回图片名称 */
@property (nonatomic, strong) NSString *returnImageName;


@property(nonatomic, weak) id<WWViewControllerDelegate> vcDelegate;

/**
 * 导航栏左按钮
 */
- (void)leftButtonMethod;


/**
 * 点击提示图，继承该函数实现点击操作
 */
- (void)clickTipView;

/**
* 是否支持侧边滑动，默认true
*/
- (BOOL)isSlideReturn;

@end
