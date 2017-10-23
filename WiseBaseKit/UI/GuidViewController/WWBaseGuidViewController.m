//
//  WWBaseGuidViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/21.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseGuidViewController.h"
#import <Masonry.h>
#import "WWDeviceDefines.h"
#import "UIView+WWExtend.h"

@interface WWBaseGuidViewController ()

/** 页数 */
@property(nonatomic, assign) NSUInteger pageCount;

@end

@implementation WWBaseGuidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageCount = 0;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WW_SCREEN_WIDTH, WW_SCREEN_HEIGHT)];
    [self.view addSubview:_scrollView];
    
    //设置scrollview的属性
//    _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width*PAGE_COUT, _scrollView.bounds.size.height);//计算ScroollView需要的大小
    _scrollView.showsHorizontalScrollIndicator=NO; //不显示水平滑动线
    _scrollView.showsVerticalScrollIndicator=NO;//不显示垂直滑动线
    _scrollView.pagingEnabled=YES;//scrollView不会停在页面之间，即只会显示第一页或者第二页，不会各一半显示
    _scrollView.bounces = NO;
}

/**
 *  添加一页view，view的大小与scrollView一样，一般为imageview
 *
 *  @param view     要添加的view
 */
- (void)addPageView:(UIView *)view
{
    view.frame = CGRectMake(_pageCount*_scrollView.width, 0, _scrollView.width, _scrollView.height);
    [_scrollView addSubview:view];
    
    _pageCount++;
    
    _scrollView.contentSize = CGSizeMake(_scrollView.width*_pageCount, _scrollView.height);
}

@end
