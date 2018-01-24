//
//  WWBaseWebViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/12/4.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseWebViewController.h"

@interface WWBaseWebViewController ()

//取消长按
@property (nonatomic, strong)WKUserScript *cancelLongPressUserScript;

@end

@implementation WWBaseWebViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isCancelLongPress = true;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationController.navigationBar.translucent = false;
    
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];//禁止长按
    [javascript appendString:@"document.documentElement.style.webkitUserSelect='none';"];//禁止选择
    _cancelLongPressUserScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    self.isNavBottom = true;
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    //注册js方法
    config.userContentController = [[WKUserContentController alloc]init];
    _webView = [[WWWebView alloc] initWithFrame:CGRectZero configuration:config];
    [self.view addSubview:_webView];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    
    if (_isCancelLongPress) {
        [self.webView.configuration.userContentController addUserScript:_cancelLongPressUserScript];
    }
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    
    if (_urlString != nil) {
        [self loadRequestWithUrl:_urlString];
    }
    
#pragma mark -- js 调用oc 的例子
/*
    //test这个需保持跟服务器端的一致，服务器端通过这个name发消息，客户端这边回调接收消息，从而做相关的处理
    [self.webView.configuration.userContentController addScriptMessageHandler:self name:@"test"];
    
    //对应js代码  window.webkit.messageHandlers.test.postMessage(inputValue);
    //inputValue 为字符串可直接传 “”； 多参数可传字典 “{title:'测试分享的标题',content:'测试分享的内容',url:'http://www.baidu.com'}”
 
*/
}

- (void)setIsCancelLongPress:(BOOL)isCancelLongPress
{
    _isCancelLongPress = isCancelLongPress;
    
    if (self.webView != nil && self.webView.configuration != nil) {
        if (isCancelLongPress) {
            [self.webView.configuration.userContentController addUserScript:_cancelLongPressUserScript];
        }
    }
}

/**
 加载url
 
 @param url url
 */
- (void)loadRequestWithUrl:(NSString *)url
{
    //设置缓存的请求策略和超时时间 重载忽略本地缓存
    NSMutableURLRequest * urlReuqest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0f];
    [self loadRequest:urlReuqest];
}


/**
 加载url
 
 @param request request
 */
- (void)loadRequest:(NSMutableURLRequest *)request
{
    [_webView loadRequest:request];
}

- (void)setIsNavBottom:(BOOL)isNavBottom
{
    _isNavBottom = isNavBottom;
    
    if (_isNavBottom) {
        if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = true;
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false;
            self.edgesForExtendedLayout = UIRectEdgeAll;
        }
    }
}

#pragma mark - wkwebdelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}

//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
//{
//
//}


#pragma mark -- WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
#pragma mark -- js 调用oc 的例子
/*
    if ([message.name isEqualToString:@"test"]) {
        message.body 为参数;js若传的字符串则该类型为NSString 若为字典则类型为NSDictionary
    }
*/
}

@end

