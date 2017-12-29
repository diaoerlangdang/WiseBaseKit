//
//  WWConfigInfo.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 沙盒中之前版本key */
extern NSString *const kWWOldVersion;

@interface WWConfigInfo : NSObject

/** 存储之前的版本 */
@property(nonatomic, strong) NSString *oldVersion;



/**
 *  版本是否有更新
 *
 *  @return 更新 true， 否则false
 */
- (BOOL)isUpdateVersion;

/**
 * 同步当前版本
 */
- (void)synchronizeCurrentVersion;

@end
