//
//  WebViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property(nonatomic, strong) WWWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView = [[WWWebView alloc] init];
    [self.view addSubview:_webView];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
    }];
    
    if (_url != nil) {
        [_webView loadRequestWithUrl:_url];
    }
}


@end
