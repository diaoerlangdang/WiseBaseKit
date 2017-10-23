//
//  NoDataViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "NoDataViewController.h"

@interface NoDataViewController ()

@end

@implementation NoDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"页面";
    self.returnImageName = nil;
    
    self.isHiddenNothing = false;
    self.nothingTipLabel.text = @"没东西,点击加载";
    self.nothingTipLabel.textColor = [UIColor whiteColor];
    self.nothingImageName = @"no_data";
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)clickNothingView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
