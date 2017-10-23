//
//  ConfigInfo.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWConfigInfo.h"

@interface ConfigInfo : WWConfigInfo

//是否登录
@property (nonatomic, assign) BOOL isLogIn;

//用户名
@property (nonatomic, strong) NSString *userName;

/**
 * 配置信息单例
 */
+ (instancetype)shareInstance;

@end
