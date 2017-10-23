//
//  WWWebView.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/29.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWWebView.h"
#import <Masonry/Masonry.h>

static CGFloat const kProgressViewHeight = 2.0f;

@implementation WWWebView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpView];
    }
    return self;
}


- (void)setUpView
{
    _wkWebView = [[WKWebView alloc]init];
    [self addSubview:_wkWebView];
    [_wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    
    _progressBar = [[UIProgressView alloc]init];
    [self addSubview:_progressBar];
    [_progressBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
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
    
    [_wkWebView loadRequest:urlReuqest];
}

/**
 *  是否能返回
 *
 *  @return 能true，否则false
 */
- (BOOL)canGoBack
{
    return [_wkWebView canGoBack];
}

/**
 *  层数
 *
 *  @return 层数
 */
- (NSInteger)countOfHistory
{
    return _wkWebView.backForwardList.backList.count;
}


/**
 *  返回
 */
- (void)goBack
{
    [_wkWebView goBack];
}


/** 监听进度条 */
- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
    if([keyPath isEqualToString:@"estimatedProgress"]){
        _progressBar.hidden = _wkWebView.estimatedProgress == 1;
        [_progressBar setProgress:_wkWebView.estimatedProgress animated:YES];
    }
}


- (void)dealloc
{
    [_wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
