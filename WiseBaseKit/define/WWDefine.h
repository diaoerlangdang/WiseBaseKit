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


#endif /* WWDefine_h */