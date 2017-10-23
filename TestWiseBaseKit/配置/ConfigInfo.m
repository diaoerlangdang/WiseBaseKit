//
//  ConfigInfo.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "ConfigInfo.h"

@implementation ConfigInfo

/**
 * 配置信息单例
 */
+ (instancetype)shareInstance
{
    static ConfigInfo *g_configInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_configInfo = [[ConfigInfo alloc] init];
    });
    return g_configInfo;
}


-(id) copyWithZone:(struct _NSZone *)zone
{
    return [ConfigInfo shareInstance] ;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

@end
