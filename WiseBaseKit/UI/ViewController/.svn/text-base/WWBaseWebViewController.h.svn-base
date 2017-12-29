//
//  WWBaseWebViewController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/12/4.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"
#import "WWWebView.h"

@interface WWBaseWebViewController : WWBaseViewController<WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler>

//url
@property(nonatomic, strong) NSString *urlString;

@property(nonatomic, strong) WWWebView *webView;

//web view 是否在nav 下面 默认 true
@property(nonatomic, assign) BOOL isNavBottom;



/**
 加载url

 @param url url
 */
- (void)loadRequestWithUrl:(NSString *)url;

/**
 加载url
 
 @param request request
 */
- (void)loadRequest:(NSMutableURLRequest *)request;

@end

