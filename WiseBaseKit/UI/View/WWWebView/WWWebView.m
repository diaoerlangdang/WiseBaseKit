//
//  WWWebView.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/29.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWWebView.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "WWDefine.h"

static CGFloat const kProgressViewHeight = 2.0f;


@implementation WWWebView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpView];
        _showRefreshHeader = false;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
        _showRefreshHeader = false;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration
{
    if (self = [super initWithFrame:frame configuration:configuration]) {
        [self setUpView];
        _showRefreshHeader = false;
    }
    return self;
}


- (void)setUpView
{
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    
    _progressBar = [[UIProgressView alloc]init];
    [self.scrollView addSubview:_progressBar];
    [_progressBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@(kProgressViewHeight));
    }];
    
}


/**
 * 加载url
 *
 * @param url 请求的url
 */
- (void)loadRequestWithUrl:(NSString *)url
{
    //设置缓存的请求策略和超时时间 重载忽略本地缓存
    NSURLRequest * urlReuqest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0f];
    
    [self loadRequest:urlReuqest];
}

/**
 *  层数
 *
 *  @return 层数
 */
- (NSInteger)countOfHistory
{
    return self.backForwardList.backList.count;
}



/** 监听进度条 */
- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"estimatedProgress"]){
        _progressBar.hidden = self.estimatedProgress == 1;
        [_progressBar setProgress:self.estimatedProgress animated:YES];
        if (_progressBar.hidden) {
            if (self.scrollView.mj_header != nil) {
                [self.scrollView.mj_header endRefreshing];
            }
            _progressBar.progress = 0;
        }
    }
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    _showRefreshHeader = showRefreshHeader;
    
    @weakify(self)
    
    if (_showRefreshHeader) {
        self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            [self reload];
        }];
    }
    else {
        self.scrollView.mj_header = nil;
    }
}


- (void)dealloc
{
    @try {
        [self removeObserver:self forKeyPath:@"estimatedProgress"];
    }
    @catch (NSException *exception) {
        
    }
}

@end

