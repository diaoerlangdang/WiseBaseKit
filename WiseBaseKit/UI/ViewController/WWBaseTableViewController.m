//
//  WWBaseTableViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseTableViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "WWDeviceDefines.h"
#import "WWDefine.h"

@interface WWBaseTableViewController ()

@property (nonatomic, readonly) UITableViewStyle style;

@end

@implementation WWBaseTableViewController

/**
 缺省tableview view 背景颜色
 */
static UIColor *_defaultTableViewBgColor = nil;

+ (UIColor *)defaultTableViewBgColor
{
    return _defaultTableViewBgColor;
}

+ (void)setDefaultTableViewBgColor:(UIColor *)defaultTableViewBgColor
{
    _defaultTableViewBgColor = defaultTableViewBgColor;
}

/**
 *  初始化controller
 *
 *  @param style    tableView类型
 *
 *  @return controller对象
 */
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    
    self.isNavBottom = true;
    _showRefreshHeader = false;
    _showRefreshFooter = false;
    _isScrollUpHideNavBar = false;
}

/** 初始化tableView */
- (void)initTableView
{
    _tableView = [[WWTableView alloc] initWithFrame:CGRectZero style:_style];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.edges.equalTo(self.view);
        }
    }];
    
    if (_defaultTableViewBgColor != nil) {
        _tableView.backgroundColor = _defaultTableViewBgColor;
    }
    
    _tableView.showsVerticalScrollIndicator = false;
    _tableView.showsHorizontalScrollIndicator = false;
    
    //设置为0，禁止自动计算cell高度，默认自动计算高度
    _tableView.estimatedRowHeight = 100;
    //设置为0，禁止自动计算footer高度
    _tableView.estimatedSectionFooterHeight = 0;
    //设置为0，禁止自动计算header高度
    _tableView.estimatedSectionHeaderHeight = 0;
    
//    if (@available(iOS 11.0, *)) {
//
//        //默认footer header都有内边距
//        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    _showRefreshHeader = showRefreshHeader;
    
    @weakify(self)
    
    if (_showRefreshHeader) {
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            [self refreshingHeader];
        }];
    }
    else {
        _tableView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    _showRefreshFooter = showRefreshFooter;
    
    @weakify(self)
    
    if (_showRefreshFooter) {
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self)
            [self refreshingFooter];
        }];
    }
    else {
        _tableView.mj_footer = nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_isScrollUpHideNavBar) {
        
        CGFloat offsetY = scrollView.contentOffset.y + _tableView.contentInset.top;
        CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:_tableView].y;
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
    [_tableView.mj_header beginRefreshing];
}

/**
 *  开始上拉刷新
 */
- (void)startRefreshFooter
{
    [_tableView.mj_footer beginRefreshing];
}

/**
 *  停止下拉刷新
 */
- (void)stopRefreshHeader
{
    [_tableView.mj_header endRefreshing];
}

/**
 *  停止上拉刷新
 */
- (void)stopRefreshFooter
{
    [_tableView.mj_footer endRefreshing];
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
    
    _tableView.hidden = !(showType == WWBaseKitShowType_Normal);
}

- (void)setIsNavBottom:(BOOL)isNavBottom
{
    _isNavBottom = isNavBottom;
    
    if (_isNavBottom) {
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = true;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false;
            self.edgesForExtendedLayout = UIRectEdgeAll;
        }
    }
}

@end
