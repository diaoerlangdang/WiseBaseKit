//
//  WWDefine.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#ifndef WWDefine_h
#define WWDefine_h
#import "WWBaseKitConfig.h"


#define WWLog(fmt, ...) do { if([WWBaseKitConfig shareInstance].debug) NSLog((fmt), ##__VA_ARGS__); }while(0);
#define WWLogDetail(fmt, ...) do { if([WWBaseKitConfig shareInstance].debug) NSLog((@"<文件名:%s> " "<函数名:%s> " "<行号:%d>  " fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__) }while(0);

//打印json
#define WWPrint_JSONString(args) WWLog(@"%@",[WWJSONUtils toJSONString:args])

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif


#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


#endif /* WWDefine_h */
