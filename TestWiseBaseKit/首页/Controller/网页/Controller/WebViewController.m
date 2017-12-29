//
//  WebViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     * 定义 js 交互 方法名（关键字） 可添加js交互
     */
//    [self.webView.configuration.userContentController addScriptMessageHandler:self name:@"test"];
    
}

/**
 加载url
 
 @param request request
 */
- (void)loadRequest:(NSMutableURLRequest *)request
{
    //可设置cookie
    
    [super loadRequest:request];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#pragma mark - wkwebdelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
    // 取加载html文件的标题名
    NSString *doc = @"document.title";
    [webView evaluateJavaScript:doc
              completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
                  if (error) {
                      WWLog(@"JSError:%@",error);
                  }
                  WWLog(@"html:%@",htmlStr);
                  self.navigationItem.title =htmlStr;
              }];
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}

//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
//{
//    //新url 打开新页
//    NSURL *URL = navigationAction.request.URL;
//    if (![URL.absoluteString isEqualToString:self.urlString]) {
//        decisionHandler(WKNavigationActionPolicyCancel);
//        WebViewController *webVC = [[WebViewController alloc] init];
//        webVC.urlString = URL.absoluteString;
//        [self.navigationController pushViewController:webVC animated:true];
//        return;
//    }
//    decisionHandler(WKNavigationActionPolicyAllow);
//}


@end
