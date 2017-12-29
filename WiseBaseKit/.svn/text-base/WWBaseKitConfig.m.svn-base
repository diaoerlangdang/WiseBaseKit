//
//  WWBaseKitConfig.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseKitConfig.h"

@implementation WWBaseKitConfig

/**
 * 配置信息单例
 */
+ (instancetype)shareInstance
{
    static WWBaseKitConfig *g_configInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_configInfo = [[WWBaseKitConfig alloc] init];
    });
    return g_configInfo;
}


-(id) copyWithZone:(struct _NSZone *)zone
{
    return [WWBaseKitConfig shareInstance] ;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _debug = false;
    }
    
    return self;
}


@end
