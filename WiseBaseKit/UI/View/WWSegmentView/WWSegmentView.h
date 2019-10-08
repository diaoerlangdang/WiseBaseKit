//
//  WWSegmentView.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/26.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 图标位置 */
typedef enum : NSUInteger {
    WWSegmentViewIconPostion_Left, //icon在左侧 default
    WWSegmentViewIconPostion_Right,//icon在右侧
} WWSegmentViewIconPostion;

typedef enum : NSUInteger {
    WWSegmentViewBottomLineType_Defalut, //默认值，底部线与内容同宽
    WWSegmentViewBottomLineType_Full,//底部线充满整个分区
} WWSegmentViewBottomLineType;

@class WWSegmentView;

@protocol WWSegmentViewDelegate <NSObject>

/**
 *  将要选择
 *
 *  @param segmentView  segmentView
 *  @param oldIndex     之前的index
 *  @param newIndex     要选择的index
 */
- (void)segmentView:(WWSegmentView *)segmentView oldIndex:(NSInteger)oldIndex newIndex:(NSInteger)newIndex;

@end

@interface WWSegmentView : UIView

/** 标题宽 默认为-1 负数表示自适应宽度 */
@property(nonatomic, assign) CGFloat titleWidth;

/** 标题字体 */
@property(nonatomic, strong) UIFont *titleFont;

/** 选中标题字体 */
@property(nonatomic, strong) UIFont *selectTitleFont;

/** 标题颜色 默认0x333333*/
@property(nonatomic, strong) UIColor *titleColor;

/** 选中标题颜色 默认0x77A9FD*/
@property(nonatomic, strong) UIColor *selectTitleColor;

/** 标题图标，默认为nil */
@property(nonatomic, strong) UIImage *titleIcon;

/** 选中标题图标，默认为nil */
@property(nonatomic, strong) UIImage *selectTitleIcon;

/** 标题数组 */
@property(nonatomic, strong) NSArray<NSString *> *titleArray;

/** icon位置 默认WWSegmentViewIconPostion_Left*/
@property(nonatomic, assign) WWSegmentViewIconPostion iconPostion;

/** 选中的位置 默认0，不得大于titleArray.cout */
@property(nonatomic, assign) NSInteger selectIndex;

/** 是否显示底部线 默认为true  */
@property(nonatomic, assign) BOOL showBottomLineView;

/** 底部线的颜色 默认0x77A9FD*/
@property(nonatomic, strong) UIColor *bottomLineColor;

/** 底部线 默认为WWSegmentViewBottomLineType_Defalut */
@property(nonatomic, assign) WWSegmentViewBottomLineType bottomLineType;

/** 代理 */
@property(nonatomic, weak) id<WWSegmentViewDelegate> delegate;

@end
