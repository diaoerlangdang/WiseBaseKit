//
//  CollectionViewCell.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *title;

//高亮 默认fasle
@property (nonatomic, assign) BOOL highLight;

/**
 *  获取cell尺寸
 *
 *  @param data 数据
 *
 *  @return 尺寸
 */
+ (CGSize)getCellSize:(NSString *)data;

@end
