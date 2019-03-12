//
//  FragmentController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "FragmentController.h"
#import "Fragment.h"
#import "TableViewController.h"

@interface FragmentController ()<WWSegmentViewDelegate, WWFragmentControllerDelegate>

@property(nonatomic, strong)WWSegmentView *segmentView;

@end

@implementation FragmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FragmentController-横向";
    
    _segmentView = [[WWSegmentView alloc] init];
    [self.view addSubview:_segmentView];
    self.fragmentDelegate = self;
    
    [_segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@45.f);
    }];
    _segmentView.delegate = self;
    _segmentView.selectTitleFont = [UIFont systemFontOfSize:20];
    _segmentView.titleIcon = [UIImage imageNamed:@"up"];
    
    NSMutableArray<NSString *> *dataArray = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"title%d",i+1]];
    }
    [dataArray addObject:[NSString stringWithFormat:@"标题标题title%d",21]];
    [dataArray addObject:[NSString stringWithFormat:@"title%d",22]];
    
    _segmentView.titleArray = dataArray;
    //    segmentView.titleIcon = [UIImage imageNamed:@"up"];
    //    segmentView.selectTitleIcon = [UIImage imageNamed:@"down"];
    
    _segmentView.selectTitleColor = [UIColor redColor];
    _segmentView.iconPostion = WWSegmentViewIconPostion_Right;
    
    @weakify(self)
    [self setFragmentConstraints:^(MASConstraintMaker * _Nonnull make) {
       
       @strongify(self)
        make.top.equalTo(self.segmentView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view);
    }];
    
    for (int i=0; i<dataArray.count; i++) {
        if (i==0) {
            TableViewController *vc = [[TableViewController alloc] init];
            [self addFragment:vc];
        }
        else {
            Fragment *fragment = [[Fragment alloc] init];
            fragment.tips = dataArray[i];
            [self addFragment:fragment];
        }
        
    }
}

#pragma mark -- WWSegmentViewDelegate

- (void)segmentView:(WWSegmentView *)segmentView oldIndex:(NSInteger)oldIndex newIndex:(NSInteger)newIndex
{
    NSString *tip;
    if (oldIndex == newIndex) {
        tip = [NSString stringWithFormat:@"选择没变%ld",newIndex+1];
        WWLog(@"%@",tip);
    }
    else {
        tip = [NSString stringWithFormat:@"选择%ld",newIndex+1];
        WWLog(@"%@",tip);
    }
    
    [self changeFragmentTo:newIndex animated:false completion:nil];
}

#pragma mark -- WWFragmentControllerDelegate
- (void)controller:(UIViewController *)vc didDragTo:(NSInteger)index
{
    _segmentView.selectIndex = index;
}

@end
