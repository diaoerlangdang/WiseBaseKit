//
//  UILabel+WWLineSpace.h
//  OASystem
//
//  Created by wuruizhi on 2018/5/2.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

//行间距
@interface UILabel (WWLineSpace)


/**
 设置内容和行间距

 @param text 内容
 @param lineSpace 行间距
 */
- (void)setText:(NSString *)text lineSpace:(CGFloat)lineSpace;

@end
