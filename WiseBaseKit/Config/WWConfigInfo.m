//
//  WWConfigInfo.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWConfigInfo.h"
#import "WWUtils.h"
#import <objc/runtime.h>


/** 当前版本的key */
NSString * const kWWOldVersion = @"ww_old_version";

@implementation WWConfigInfo


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}


- (void)setOldVersion:(NSString *)oldVersion
{
    if (oldVersion == nil) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:oldVersion forKey:kWWOldVersion];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)oldVersion
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kWWOldVersion];
}

/**
 *  版本是否有更新
 *
 *  @return 更新 true， 否则false
 */
- (BOOL)isUpdateVersion
{
    NSString *version =  [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSInteger result = [WWUtils compareVersion:version to: self.oldVersion];
    
    //版本有更新
    if (result > 0) {
        return true;
    }
    return false;
}

/**
 * 同步当前版本
 */
- (void)synchronizeCurrentVersion
{
    NSString *version =  [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    self.oldVersion = version;
}


@end
