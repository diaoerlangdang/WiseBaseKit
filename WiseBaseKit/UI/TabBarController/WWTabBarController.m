//
//  WWTabBarController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/21.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWTabBarController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface WWTabBarController ()

@end

@implementation WWTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _isPlaySound = true;
        _isAnimation = true;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (_isAnimation) {
        [self animationWithIndex:index];//动画
    }
    
    if (_isPlaySound) {
        [self playSound];//音效
    }
}



/**
 播放声音
 */
-(void)playSound
{
    NSString *path = [NSString stringWithFormat:@"%@/like.caf",[[NSBundle bundleForClass:[WWBaseViewController class]] pathForResource:@"WiseKitResource" ofType:@"bundle"]];
    if (_soundPath != nil) {
        path = _soundPath;
    }
    SystemSoundID soundID;
    NSURL *soundURL = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,&soundID);
    AudioServicesPlaySystemSound(soundID);
    
}


/**
 动画，当isAnimation=true时，切换tab时执行该函数，可重写
 
 @param index 角标
 */
- (void)animationWithIndex:(NSInteger) index
{
    NSMutableArray<UIView *> * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    
    //排序
    [tabbarbuttonArray sortUsingComparator:^NSComparisonResult(UIView*  _Nonnull obj1, UIView*  _Nonnull obj2) {
        
        if (obj1.frame.origin.x > obj2.frame.origin.x) {
            return NSOrderedDescending;
        }
        else {
            return NSOrderedSame;
        }
        
    }];
    
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
}

@end
