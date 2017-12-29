//
//  WWBaseCollectionViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseCollectionViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "WWDeviceDefines.h"

@interface WWBaseCollectionViewController ()

@end

@implementation WWBaseCollectionViewController

/**
 缺省collection view 背景颜色
 */
static UIColor *_defaultCollectionViewBgColor = nil;

+ (UIColor *)defaultCollectionViewBgColor
{
    return _defaultCollectionViewBgColor;
}

+ (void)setDefaultCollectionViewBgColor:(UIColor *)defaultCollectionViewBgColor
{
    _defaultCollectionViewBgColor = defaultCollectionViewBgColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initCollectionView];
    
    self.isNavBottom = true;
    _showRefreshHeader = false;
    _showRefreshFooter = false;
    _isScrollUpHideNavBar = false;
}

/** 初始化CollectionView */
- (void)initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [self collectionViewFlowLayout];
    if (flowLayout == nil) {
        flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView.showsVerticalScrollIndicator = false;
    _collectionView.showsHorizontalScrollIndicator = false;
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (_defaultCollectionViewBgColor != nil) {
        _collectionView.backgroundColor = _defaultCollectionViewBgColor;
    }
    
    //    if (@available(iOS 11.0, *)) {
    //
    //        //默认footer header都有内边距
    //        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    //    }
    
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    _showRefreshHeader = showRefreshHeader;
    
    __weak typeof(self) wself = self;
    
    if (_showRefreshHeader) {
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [wself refreshingHeader];
        }];
    }
    else {
        _collectionView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    _showRefreshFooter = showRefreshFooter;
    
    __weak typeof(self) wself = self;
    
    if (_showRefreshFooter) {
        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [wself refreshingFooter];
        }];
    }
    else {
        _collectionView.mj_footer = nil;
    }
}

#pragma mark - Collection View data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

/**
 *  collection view 布局
 *
 *  @return 布局
 */
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_isScrollUpHideNavBar) {
        
        CGFloat offsetY = scrollView.contentOffset.y + _collectionView.contentInset.top;
        CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:_collectionView].y;
        if (offsetY > WW_NAVIGATION_BAR_HEIGHT) {
            //下滑趋势
            if (panTranslationY > 0) {
                [self.navigationController setNavigationBarHidden:false animated:true];
            }
            else {
                [self.navigationController setNavigationBarHidden:true animated:true];
            }
        }
        else {
            [self.navigationController setNavigationBarHidden:false animated:true];
        }
    }
    
}

/**
 *  开始下拉刷新
 */
- (void)startRefreshHeader
{
    [_collectionView.mj_header beginRefreshing];
}

/**
 *  开始上拉刷新
 */
- (void)startRefreshFooter
{
    [_collectionView.mj_footer beginRefreshing];
}

/**
 *  停止下拉刷新
 */
- (void)stopRefreshHeader
{
    [_collectionView.mj_header endRefreshing];
}

/**
 *  停止上拉刷新
 */
- (void)stopRefreshFooter
{
    [_collectionView.mj_footer endRefreshing];
}


/**
 *  正在下拉刷新，子类可重写实现
 */
- (void)refreshingHeader
{
    [self stopRefreshHeader];
}

/**
 *  正在上拉刷新，子类可重写实现
 */
- (void)refreshingFooter
{
    [self stopRefreshFooter];
}

- (void)setShowType:(WWBaseKitShowType)showType
{
    [super setShowType:showType];
    
    _collectionView.hidden = !(showType == WWBaseKitShowType_Normal);
}

- (void)setIsNavBottom:(BOOL)isNavBottom
{
    _isNavBottom = isNavBottom;
    
    if (_isNavBottom) {
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = true;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false;
            self.edgesForExtendedLayout = UIRectEdgeAll;
        }
    }
}


@end

