//
//  WWBaseTableViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseTableViewController.h"
#import <Masonry.h>
#import <MJRefresh.h>

@interface WWBaseTableViewController ()

@property (nonatomic, readonly) UITableViewStyle style;

@end

@implementation WWBaseTableViewController

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
    
    _showRefreshHeader = false;
    _showRefreshFooter = false;
}

/** 初始化tableView */
- (void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_style];
    [self.view addSubview:_tableView];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (@available(iOS 11.0, *)) {
        //设置为0，禁止自动计算cell高度
        _tableView.estimatedRowHeight = 0;
        //设置为0，禁止自动计算footer高度
        _tableView.estimatedSectionFooterHeight = 0;
        //设置为0，禁止自动计算header高度
        _tableView.estimatedSectionHeaderHeight = 0;
        //默认footer header都有内边距
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    _showRefreshHeader = showRefreshHeader;
    
    __weak typeof(self) wself = self;
    
    if (_showRefreshHeader) {
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [wself refreshingHeader];
        }];
    }
    else {
        _tableView.mj_header = nil;
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    _showRefreshFooter = showRefreshFooter;
    
    __weak typeof(self) wself = self;
    
    if (_showRefreshFooter) {
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [wself refreshingFooter];
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

@end
