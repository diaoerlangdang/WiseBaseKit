//
//  AppDelegate.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "AppDelegate.h"
#import "GuidViewController.h"
#import "WiseBaseKit.h"
#import "MainPageViewController.h"
#import "NoDataViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置默认颜色
    WWBaseTableViewController.defaultTableViewBgColor = WW_COLOR_HexRGB(0xeeeeee);
    
    [WWBaseKitConfig shareInstance].debug = true;
    
    [ConfigInfo shareInstance].isLogIn = true;
    
    [CSToastManager setDefaultPosition: CSToastPositionCenter];
    
    [[UINavigationBar appearance] ww_setBackgroundColor:WW_COLOR_HexRGB(0xee0000)];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:attr];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
    if ([[ConfigInfo shareInstance] isUpdateVersion]) {
        
        GuidViewController *vc = [[GuidViewController alloc] init];
        self.window.rootViewController = vc;
    }
    else {
        
        
        WWNavigationController *nav1 = [[WWNavigationController alloc] initWithRootViewController:[[MainPageViewController alloc] init]];
        nav1.title = @"首页";
        
         WWNavigationController *nav2 = [[WWNavigationController alloc] initWithRootViewController:[[NoDataViewController alloc] init]];
        nav2.title = @"页面";
        
        WWTabBarController *tabC = [[WWTabBarController alloc] init];
        tabC.viewControllers = @[nav1, nav2];
        
        self.window.rootViewController = tabC;
    }

    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
