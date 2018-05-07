//
//  UILabel+WWLineSpace.m
//  OASystem
//
//  Created by wuruizhi on 2018/5/2.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import "UILabel+WWLineSpace.h"

@implementation UILabel (WWLineSpace)

/**
 设置内容和行间距
 
 @param text 内容
 @param lineSpace 行间距
 */
- (void)setText:(NSString *)text lineSpace:(CGFloat)lineSpace
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;// 字体的行间距
    NSDictionary *attributesInfo = @{
                                     NSFontAttributeName:self.font,
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
    
    NSMutableAttributedString *textAttr = [[NSMutableAttributedString alloc] initWithString:text attributes:attributesInfo];
    self.attributedText = textAttr;
}

@end
