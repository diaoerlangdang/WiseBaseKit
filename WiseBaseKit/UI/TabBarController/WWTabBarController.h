//
//  WWTabBarController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/21.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWTabBarController : UITabBarController


/**
 是否播放声音
 */
@property (nonatomic, assign) BOOL isPlaySound;


/**
 声音路径，有默认声音
 */
@property (nonatomic, strong) NSString *soundPath;


/**
 是否有动画
 */
@property (nonatomic, assign) BOOL isAnimation;


/**
 动画，当isAnimation=true时，切换tab时执行该函数，可重写
 
 @param index 角标
 */
- (void)animationWithIndex:(NSInteger) index;

@end

