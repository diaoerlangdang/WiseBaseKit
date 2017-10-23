//
//  WWJSONUtils.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWJSONUtils : NSObject

/**
 *  将字典或者数组转化为字符串
 *
 *  @param theData     字典或数组
 *
 *  @return 字符串
 */
+ (NSString *)toJSONString:(id)theData;


/**
 *  将字典或者数组转化为JSON串
 *
 *  @param theData     字典或数组
 *
 *  @return json
 */
+ (NSData *)toJSONData:(id)theData;

/**
 *  将JSON串转化为字典或者数组
 *
 *  @param jsonData     json数据
 *
 *  @return 数组或字典
 */
+ (id)toArrayOrNSDictionary:(NSData *)jsonData;

@end
