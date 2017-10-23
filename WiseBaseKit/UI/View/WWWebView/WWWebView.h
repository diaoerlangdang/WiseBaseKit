//
//  WWWebView.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/29.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WWWebView : UIView

/** webview */
@property(nonatomic, strong) WKWebView *wkWebView;

/** 进度条 */
@property(nonatomic, strong) UIProgressView *progressBar;

/**
 * 加载url
 *
 * @param url 请求的url
 */
- (void)loadRequestWithUrl:(NSString *)url;

/**
 *  是否能返回
 *
 *  @return 能true，否则false
 */
- (BOOL)canGoBack;

/**
 *  层数
 *
 *  @return 层数
 */
- (NSInteger)countOfHistory;


/**
 *  返回
 */
- (void)goBack;


@end
