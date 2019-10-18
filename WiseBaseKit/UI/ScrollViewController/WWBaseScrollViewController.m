//
//  WWBaseScrollViewController.m
//  TestWiseBaseKit
//
//  Created by 吴睿智 on 2019/10/18.
//  Copyright © 2019 wuruizhi. All rights reserved.
//

#import "WWBaseScrollViewController.h"

@interface WWBaseScrollViewController ()

@end

@implementation WWBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [UIScrollView new];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //隐藏水平条
    _scrollView.showsHorizontalScrollIndicator = false;
    //隐藏垂直条
    _scrollView.showsVerticalScrollIndicator = false;
    
    //禁止回弹
    _scrollView.bounces = false;
    
    _contentView = [UIView new];
    [_scrollView addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
}


@end
