//
//  WWColorFontDefines.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#ifndef WWColorFontDefines_h
#define WWColorFontDefines_h

#pragma mark - 颜色

#define WW_COLOR_HexRGB(rgbValue) [UIColor \
    colorWithRed:((float)((rgbValue & 0xFF0000) >>16))/255.0 \
    green:((float)((rgbValue & 0xFF00) >>8))/255.0 \
    blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//随机颜色
#define WW_COLOR_RANDOM     [UIColor colorWithHue:(arc4random() % 256 / 256.0)\
    saturation:(arc4random() % 128 / 256.0 + 0.5)\
    brightness:(arc4random() % 128 / 256.0 + 0.5) alpha:1]

#define WW_COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define WW_COLOR_RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]


#pragma mark - 字体

#define WW_Font_Bold(a)             [UIFont boldSystemFontOfSize:a]
#define WW_Font(a)                 [UIFont systemFontOfSize:a]


#endif /* WWColorFontDefines_h */
