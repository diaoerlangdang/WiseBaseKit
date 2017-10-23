//
//  WWUtils.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWCryptoUtils.h"
#import "WWRegexUtils.h"
#import "WWJSONUtils.h"

@interface WWUtils : NSObject

/**
 *  判断是否是空字符串包括空格
 *
 *  @param str     数据
 *
 *  @return 字符串为空true，否则false
 */
+ (BOOL)isEmptyString:(NSString *)str;

/**
 *  去评分
 *
 *  @param appid     appid
 */
+ (void)toAppStoreGrade:(NSString*)appid;


/**
 *  获取本机IP地址
 *
 *  @return IP地址
 */
+ (NSString *)getIPAddress;


/**
 *  比较两个版本号的大小
 *
 *  @param v1 第一个版本号
 *  @param v2 第二个版本号
 *
 *  @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
 */
+ (NSInteger)compareVersion:(NSString *)v1 to:(NSString *)v2;

@end
