//
//  GuidViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/21.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "GuidViewController.h"
#import "WiseBaseKit.h"
#import "MainPageViewController.h"
#import "NoDataViewController.h"

@interface GuidViewController ()

@end

@implementation GuidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<2; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d",(i+1)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"第%d页",i+1];
        label.textColor = [UIColor whiteColor];
        [imageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(imageView);
        }];
        
        [self addPageView:imageView];
        
        if (i == 1) {
            imageView.userInteractionEnabled = true;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.borderWidth = 1;
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            button.layer.cornerRadius = 5.f;
            button.layer.masksToBounds = true;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(goToMain) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(imageView).offset(-20);
                make.centerX.equalTo(imageView);
                make.width.equalTo(@100);
            }];
        }
    }
}


//跳转到主页
- (void)goToMain
{
    WWLog(@"%@",[NSNumber numberWithBool:[ConfigInfo shareInstance].isLogIn]);
    [[ConfigInfo shareInstance] synchronizeCurrentVersion];
    
    WWNavigationController *nav1 = [[WWNavigationController alloc] initWithRootViewController:[[MainPageViewController alloc] init]];
    nav1.title = @"首页";
    
    WWNavigationController *nav2 = [[WWNavigationController alloc] initWithRootViewController:[[NoDataViewController alloc] init]];
    nav2.title = @"页面";
    
    WWTabBarController *tabC = [[WWTabBarController alloc] init];
    tabC.viewControllers = @[nav1, nav2];
    
    tabC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:tabC animated:true completion:nil];
}


@end
