//
//  UIImage+WWScale.h
//  WiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WWScale)

/**
 *  获取固定大小的image
 *
 *  @param size      得到图片的尺寸
 *
 *  @return 固定大小的image
 */
- (UIImage*)imageToSize:(CGSize)size;


/**
 *  等比缩放
 *
 *  @param scale     缩放系数
 *
 *  @return 缩放后的的image
 */
- (UIImage*)imageToScale:(float)scale;

@end
