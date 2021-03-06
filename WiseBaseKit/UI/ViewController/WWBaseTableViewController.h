//
//  WWBaseTableViewController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"
#import "WWTableView.h"

@interface WWBaseTableViewController : WWBaseViewController<UITableViewDataSource, UITableViewDelegate>

/* 默认的tableview背景颜色 */
@property (class, strong, nonatomic) UIColor *defaultTableViewBgColor;

/** tableView */
@property(nonatomic, strong, readonly) WWTableView *tableView;

//是否允许下拉刷新，默认为false
@property(nonatomic, assign) BOOL showRefreshHeader;

//是否允许上拉加载，默认为false
@property(nonatomic, assign) BOOL showRefreshFooter;

//是否上滑隐藏导航栏
@property(nonatomic, assign) BOOL isScrollUpHideNavBar;

//table view 是否在nav 下面 默认 true
@property(nonatomic, assign) BOOL isNavBottom;

/**
 *  初始化controller
 *
 *  @param style    tableView类型
 *
 *  @return controller对象
 */
- (instancetype)initWithStyle:(UITableViewStyle)style;

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
