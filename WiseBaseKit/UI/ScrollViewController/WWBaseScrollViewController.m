//
//  WWBaseScrollViewController.m
//  TestWiseBaseKit
//
//  Created by 吴睿智 on 2019/10/18.
//  Copyright © 2019 wuruizhi. All rights reserved.
//

#import "WWBaseScrollViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "WWDeviceDefines.h"
#import "WWDefine.h"

@interface WWBaseScrollViewController ()

@end

@implementation WWBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _showRefreshHeader = false;
    _showRefreshFooter = false;
    
    _scrollView = [UIScrollView new];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //隐藏水平条
    _scrollView.showsHorizontalScrollIndicator = false;
    //隐藏垂直条
    _scrollView.showsVerticalScrollIndicator = false;
    
    _contentView = [UIView new];
    [_scrollView addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    _showRefreshHeader = showRefreshHeader;
    
    @weakify(self)
    
    if (_showRefreshHeader) {
        _scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            [self refreshingHeader];
        }];
    }
    else {
        _scrollView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    _showRefreshFooter = showRefreshFooter;
    
    @weakify(self)
    
    if (_showRefreshFooter) {
        _scrollView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self)
            [self refreshingFooter];
        }];
    }
    else {
        _scrollView.mj_footer = nil;
    }
}

/**
 *  开始下拉刷新
 */
- (void)startRefreshHeader
{
    [_scrollView.mj_header beginRefreshing];
}

/**
 *  开始上拉刷新
 */
- (void)startRefreshFooter
{
    [_scrollView.mj_footer beginRefreshing];
}

/**
 *  停止下拉刷新
 */
- (void)stopRefreshHeader
{
    [_scrollView.mj_header endRefreshing];
}

/**
 *  停止上拉刷新
 */
- (void)stopRefreshFooter
{
    [_scrollView.mj_footer endRefreshing];
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
    
    _scrollView.hidden = !(showType == WWBaseKitShowType_Normal);
}

@end
