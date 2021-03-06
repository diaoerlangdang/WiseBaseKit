//
//  UIViewController+WWFragment.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WWFragment)

/**
 * 将要显示当前fragment
 */
- (void)willShowCurrentFragment;

/**
 * 将要隐藏当前fragment
 */

- (void)willHideCurrentFragment;

/**
 * 当前fragment 被点击
 */
- (void)currentFragmentClicked;

@end
