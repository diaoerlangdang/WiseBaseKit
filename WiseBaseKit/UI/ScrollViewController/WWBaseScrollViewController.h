//
//  WWBaseScrollViewController.h
//  TestWiseBaseKit
//
//  Created by 吴睿智 on 2019/10/18.
//  Copyright © 2019 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWBaseScrollViewController : WWBaseViewController

// 滑动view
@property (nonatomic, strong) UIScrollView *scrollView;

// 内容view
@property (nonatomic, strong) UIView *contentView;

//是否允许下拉刷新，默认为false
@property(nonatomic, assign) BOOL showRefreshHeader;

//是否允许上拉加载，默认为false
@property(nonatomic, assign) BOOL showRefreshFooter;

/**
 *  开始下拉刷新
 */
- (void)startRefreshHeader;

/**
 *  开始上拉刷新
 */
- (void)startRefreshFooter;

/**
 *  停止下拉刷新
 */
- (void)stopRefreshHeader;

/**
 *  停止上拉刷新
 */
- (void)stopRefreshFooter;

/**
 *  正在下拉刷新，子类可重写实现
 */
- (void)refreshingHeader;

/**
 *  正在上拉刷新，子类可重写实现
 */
- (void)refreshingFooter;

@end

NS_ASSUME_NONNULL_END
