//
//  WWBaseViewController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "UIView+WWExtend.h"
#import "UIViewController+WWFragment.h"

@protocol MDViewControllerDelegate <NSObject>

/**
 *  界面返回代理 模态弹出时使用；方便操作父controller的数据
 *
 *  @param vc           返回的视图
 *  @param isSuccess    是否成功
 */
- (void)controller:(UIViewController *)vc back:(BOOL)isSuccess;

@end

@interface WWBaseViewController : UIViewController<MDViewControllerDelegate>

/**
 * 当没有数据时显示提示图，默认隐藏
 */
@property (nonatomic, strong) UIImageView *nothingImageView;

/**
 * 当没有数据时显示的友好提示语，默认隐藏
 */
@property (nonatomic, strong) UILabel *nothingTipLabel;

/** 什么都没有显示的图片 */
@property (nonatomic, strong) NSString *nothingImageName;

/** 什么都没有提示的文字*/
@property (nonatomic, strong) NSString *nothingTip;

/** 是否显示什么都没有时的图片和文字 默认不显示 为true */
@property (nonatomic, assign) BOOL isHiddenNothing;

/**  返回图片名称 */
@property (nonatomic) NSString *returnImageName;


@property(nonatomic, weak) id<MDViewControllerDelegate> vcDelegate;

/**
 * 导航栏左按钮
 */
- (void)leftButtonMethod;


/**
 * 点击没数据的提示图，继承该函数实现点击操作
 */
- (void)clickNothingView;

@end
