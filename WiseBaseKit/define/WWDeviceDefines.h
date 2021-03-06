//
//  WWDeviceDefines.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#ifndef WWDeviceDefines_h
#define WWDeviceDefines_h


/** 屏幕宽度 */
#define WW_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

/** 屏幕高度 */
#define WW_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

/** 去除导航栏高度 */
#define WW_SCREEN_VIEW_HEIGHT (WW_SCREEN_HEIGHT - WW_NAVIGATION_BAR_HEIGHT)

/**
 *  顶部导航栏和底部导航栏的高度
 *
 */
#define WW_NAVIGATION_BAR_HEIGHT         44.0f + WW_STATUS_BAR_HEIGHT
#define WW_TARBAR_HEIGHT                 49.0f
#define WW_STATUS_BAR_HEIGHT             [UIApplication sharedApplication].statusBarFrame.size.height

//是否为iOS 7.0
#define WW_iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

//是否为iOS 8.0
#define WW_iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//是否为iOS 9.0
#define WW_iOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

//是否为iOS 10.0
#define WW_iOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

//是否为iOS 11.0
#define WW_iOS11 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)

//判断设备型号
#define WW_IS_LANDSCAPE         ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)

#define WW_IS_IPAD              ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define WW_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#define WW_IS_IPHONE4           (WW_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define WW_IS_IPHONE5           (WW_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define WW_IS_IPHONE6           (WW_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define WW_IS_IPHONE6PLUS       (WW_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0) // Both orientations

#define WW_IS_IPHONEX           (WW_IS_IPHONE && ([UIApplication sharedApplication].statusBarFrame.size.height == 44))


#endif /* WWDeviceDefines_h */
