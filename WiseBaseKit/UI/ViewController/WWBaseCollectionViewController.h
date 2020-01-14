//
//  WWBaseCollectionViewController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"

@interface WWBaseCollectionViewController : WWBaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>


/**
 缺省collection view 背景颜色
 */
@property (class, nonatomic, strong) UIColor *defaultCollectionViewBgColor;

/** collectionView */
@property(nonatomic, strong, readonly) UICollectionView *collectionView;

//是否允许下拉刷新，默认为false
@property(nonatomic, assign) BOOL showRefreshHeader;

//是否允许上拉加载，默认为false
@property(nonatomic, assign) BOOL showRefreshFooter;

//是否上滑隐藏导航栏
@property(nonatomic, assign) BOOL isScrollUpHideNavBar;

//collection view 是否在nav 下面 默认 true
@property(nonatomic, assign) BOOL isNavBottom;

/**
 *  collection view 布局; 可重写布局
 *
 *  @return 布局
 */
- (UICollectionViewLayout *)collectionViewLayout;

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

