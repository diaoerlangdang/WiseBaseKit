//
//  WWBaseFragmentController.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/22.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"
#import "UIViewController+WWFragment.h"
#import <Masonry.h>

@protocol WWFragmentControllerDelegate <NSObject>

@optional

/**
 *  已经滑动到index页面
 *
 *  @param vc       视图
 *  @param index    滑动到页面的index
 *
 */
- (void)controller:(UIViewController *_Nonnull)vc didDragTo:(NSInteger)index;

@end

@interface WWBaseFragmentController : WWBaseViewController

/**
 *  scrollview
 */
@property(nonatomic, strong, nonnull) UIScrollView * scrollView;

@property(nonatomic, weak, nullable) id <WWFragmentControllerDelegate> fragmentDelegate;


/**
 *  fragment数组
 */
@property(nonatomic, strong, readonly, nonnull) NSMutableArray<UIViewController *> *fragmentArray;


/**
 *  是否支持水平滑动，默认支持
 */
@property(nonatomic, assign) BOOL isHorizontalEnable;

/**
 *  当前选中的页
 */
@property(nonatomic, assign, readonly) NSInteger currentIndex;


/**
 *  设置fragment的frame 绝对布局
 *
 *  @param frame    fragment的frame
 */
- (void)setFragmentFrame:(CGRect)frame;


/**
 *  设置fragment的frame 相对布局
 *
 *  @param block    Masonry自动布局
 */
- (void)setFragmentConstraints:(void(^_Nonnull)(MASConstraintMaker *_Nonnull))block;


/**
 *  添加fragment,对应的index为fragmentArray的角标
 *
 *  @param fragment  添加的fragment
 */
- (void)addFragment:(UIViewController *_Nonnull)fragment;



/**
 *  移除fragment
 *
 *  @param fragment  要移除的fragment
 */
- (void)removeFragment:(UIViewController *_Nonnull)fragment;


/**
 *  移除fragment
 *
 *  @param fragmentIndex  要移除的fragment的index
 */
- (void)removeFragmentWithIndex:(NSInteger)fragmentIndex;


/**
 *  跳转到新的fragment
 *
 *  @param newFragmentIndex  要跳转的fragment的index
 */
- (void)changeFragmentTo:(NSInteger)newFragmentIndex;

/**
 *  跳转到新的fragment
 *
 *  @param newFragmentIndex  要跳转的fragment的index
 *  @param animated          是否有动画
 *  @param completion        完成block
 */
- (void)changeFragmentTo:(NSInteger)newFragmentIndex animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

@end
