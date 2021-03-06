//
//  WWWebView.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/29.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WWWebView : WKWebView

/** 进度条 */
@property(nonatomic, strong) UIProgressView *progressBar;

//是否允许下拉刷新，默认为false
@property(nonatomic, assign) BOOL showRefreshHeader;

/**
 * 加载url
 *
 * @param url 请求的url
 */
- (void)loadRequestWithUrl:(NSString *)url;


/**
 *  层数
 *
 *  @return 层数
 */
- (NSInteger)countOfHistory;



@end

