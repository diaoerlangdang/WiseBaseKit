//
//  WWNavigationController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/15.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWNavigationController.h"

@interface WWNavigationController ()

@end

@implementation WWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = true; //viewController是将要被push的控制器
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.visibleViewController;
    
}


@end
