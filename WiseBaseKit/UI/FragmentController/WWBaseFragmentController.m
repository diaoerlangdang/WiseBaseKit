//
//  WWBaseFragmentController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/22.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseFragmentController.h"

@interface WWBaseFragmentController ()<UIScrollViewDelegate>

//是否可滑动
@property(nonatomic, assign) BOOL scrollEnable;

@property(nonatomic, strong) UIView *contentView;

@end

@implementation WWBaseFragmentController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initData];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initData];
    }
    
    return self;
}


/** 初始化数据 */
- (void)initData
{
    _fragmentArray = [NSMutableArray array];
    _currentIndex = -1;
    _scrollEnable = true;
    _isHorizontalEnable = true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor grayColor];
    
    _contentView = [UIView new];
    [_scrollView addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    //隐藏水平条
    _scrollView.showsHorizontalScrollIndicator = false;
    
    //按页滑动
    _scrollView.pagingEnabled = true;
    
    //禁止回弹
    _scrollView.bounces = false;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_currentIndex >= 0 && _fragmentArray.count>_currentIndex) {
        [_fragmentArray[_currentIndex] willShowCurrentFragment];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_currentIndex >= 0 && _fragmentArray.count>_currentIndex) {
        [_fragmentArray[_currentIndex] willHideCurrentFragment];
    }
}

- (void)setIsHorizontalEnable:(BOOL)isHorizontalEnable
{
    _scrollView.scrollEnabled = isHorizontalEnable;
}

/**
 *  设置fragment的frame 绝对布局
 *
 *  @param frame    fragment的frame
 */
- (void)setFragmentFrame:(CGRect)frame
{
    _scrollView.frame = frame;
}


/**
 *  设置fragment的frame 相对布局
 *
 *  @param block    Masonry自动布局
 */
- (void)setFragmentConstraints:(void(^_Nonnull)(MASConstraintMaker *_Nonnull))block
{
    [_scrollView mas_makeConstraints:block];
}

/**
 *  添加fragment,对应的index为fragmentArray的角标
 *
 *  @param fragment  添加的fragment
 */
- (void)addFragment:(UIViewController *_Nonnull)fragment
{
    UIView *lastView = nil;
    
    //初始显示第一个fragment
    if (_fragmentArray.count == 0) {
        
        _currentIndex = 0;
    }
    else {
        lastView = _fragmentArray[_fragmentArray.count-1].view;
    }
    
    [self addChildViewController:fragment];
    [_contentView addSubview:fragment.view];
    [fragment didMoveToParentViewController:self];

    [fragment.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lastView ? lastView.mas_right : @0);
        make.top.equalTo(@0);
        make.width.equalTo(_scrollView.mas_width);
        make.height.equalTo(_scrollView.mas_height);
    }];

    lastView = fragment.view;

    [_contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
        make.edges.equalTo(_scrollView);
        make.height.equalTo(_scrollView);
    }];

    [_scrollView layoutIfNeeded];
    [_fragmentArray addObject:fragment];
}


/**
 *  移除fragment
 *
 *  @param fragment  要移除的fragment
 */
- (void)removeFragment:(UIViewController *_Nonnull)fragment
{
    NSInteger index =  [_fragmentArray indexOfObject:fragment];
    
    [self removeFragmentWithIndex:index];
}


/**
 *  移除fragment
 *
 *  @param fragmentIndex  要移除的fragment的index
 */
- (void)removeFragmentWithIndex:(NSInteger)fragmentIndex
{
    if (fragmentIndex<0 || fragmentIndex>=_fragmentArray.count) {
        return ;
    }
    
    CGRect frame = _fragmentArray[fragmentIndex].view.frame;
    CGRect tempFrame = CGRectZero;
    
    for (NSInteger i=0; i<_fragmentArray.count; i++) {
        
        //将后面的view 往前移
        if (i > fragmentIndex) {
            tempFrame = _fragmentArray[i].view.frame;
            _fragmentArray[i].view.frame = frame;
            frame = tempFrame;
        }
    }
    
    [_fragmentArray[fragmentIndex] willMoveToParentViewController:nil];
    [_fragmentArray[fragmentIndex] removeFromParentViewController];
    
    //从页面删除
    [_fragmentArray[fragmentIndex].view removeFromSuperview];
    
    [_fragmentArray removeObjectAtIndex:fragmentIndex];
    
    if (_fragmentArray.count > 0) {
        UIViewController *fragment = _fragmentArray[_fragmentArray.count-1];
        [_scrollView setContentSize:CGSizeMake(fragment.view.frame.origin.x+fragment.view.frame.size.width, frame.size.height)];
    }
    else {
        [_scrollView setContentSize:_scrollView.frame.size];
    }
    
    
    
}


/**
 *  跳转到新的fragment
 *
 *  @param newFragmentIndex  要跳转的fragment的index
 */
- (void)changeFragmentTo:(NSInteger)newFragmentIndex
{
    [self changeFragmentTo:newFragmentIndex animated:false completion:nil];
    
    
}

/**
 *  跳转到新的fragment
 *
 *  @param newFragmentIndex  要跳转的fragment的index
 *  @param animated          是否有动画
 *  @param completion        完成block
 */
- (void)changeFragmentTo:(NSInteger)newFragmentIndex animated:(BOOL)animated completion:(void (^ __nullable)(void))completion
{
    //不执行跳转
    if (newFragmentIndex<0 || newFragmentIndex>=_fragmentArray.count || newFragmentIndex==_currentIndex) {
        
        if (newFragmentIndex == _currentIndex) {
            [_fragmentArray[newFragmentIndex] currentFragmentClicked];
        }
        
        return;
    }
    
    //防止执行重复代码，也可区分出是主动跳转还是滑动
    _scrollEnable = false;
    
    //将要隐藏的fragment
    [_fragmentArray[_currentIndex] willHideCurrentFragment];
    
    //将要显示的fragment
    [_fragmentArray[newFragmentIndex] willShowCurrentFragment];
    
    
    //执行动画
    if (animated) {
        
        [UIView animateWithDuration:0.5 animations:^{
            [_scrollView setContentOffset:CGPointMake(_fragmentArray[newFragmentIndex].view.frame.origin.x, 0) animated:false];
        } completion:^(BOOL finished) {
            
            //改变index
            _currentIndex = newFragmentIndex;
            
            _scrollEnable = true;
            if (completion != nil) {
                completion();
            }
            
        }];
    }
    else {
        [_scrollView setContentOffset:CGPointMake(_fragmentArray[newFragmentIndex].view.frame.origin.x, 0) animated:false];
        //改变index
        _currentIndex = newFragmentIndex;
        
        _scrollEnable = true;
        if (completion != nil) {
            completion();
        }
    }
    
    
    
    
}


#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width + .5);
    
    //换页
    if (page != _currentIndex && _scrollEnable) {
        
        //将要隐藏的fragment
        [_fragmentArray[_currentIndex] willHideCurrentFragment];
        
        //将要显示的fragment
        [_fragmentArray[page] willShowCurrentFragment];
        
        //改变index
        _currentIndex = page;
        
        if (_fragmentDelegate && [_fragmentDelegate respondsToSelector:@selector(controller:didDragTo:)]) {
            [_fragmentDelegate controller:self didDragTo:page];
        }
    }
    
}


@end
