//
//  WWJSONUtils.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWJSONUtils.h"

@implementation WWJSONUtils


/**
 *  将字典或者数组转化为字符串
 *
 *  @param theData     字典或数组
 *
 *  @return 字符串
 */
+ (NSString *)toJSONString:(id)theData
{
    NSData *data = [self toJSONData:theData];
    if (data == nil) {
        return @"";
    }
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"JSONString:%@",string);
    
    return string;
}


/**
 *  将字典或者数组转化为JSON串
 *
 *  @param theData     字典或数组
 *
 *  @return json
 */
+ (NSData *)toJSONData:(id)theData
{
    NSError *error = nil;
    
    if (theData == nil) {
        return nil;
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:nil];
    
    if ([jsonData length]&&error== nil){
        return jsonData;
    }else{
        return nil;
    }
}

/**
 *  将JSON串转化为字典或者数组
 *
 *  @param jsonData     json数据
 *
 *  @return 数组或字典
 */
+ (id)toArrayOrNSDictionary:(NSData *)jsonData
{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}



@end
