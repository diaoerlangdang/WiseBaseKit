//
//  WWBaseViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/14.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"
#import "WWColorFontDefines.h"


@interface WWBaseViewController ()


@end

@implementation WWBaseViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认不显示
        _isHiddenNothing = true;
        
        _nothingTip = nil;
        _nothingImageName = nil;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    _nothingImageView = [UIImageView new];
    [self.view addSubview:_nothingImageView];
    [_nothingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [_nothingImageView addTapAction:self selector:@selector(clickNothingView)];
    
    if (_nothingImageName != nil) {
        [_nothingImageView setImage:[UIImage imageNamed:_nothingImageName]];
    }
    _nothingImageView.hidden = _isHiddenNothing;
    
    _nothingTipLabel = [UILabel new];
    _nothingTipLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_nothingTipLabel];
    [_nothingTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_nothingImageView.mas_centerX);
        make.top.equalTo(_nothingImageView.mas_bottom).offset(10);
    }];
    
    [_nothingTipLabel addTapAction:self selector:@selector(clickNothingView)];
    if (_nothingTip != nil) {
        _nothingTipLabel.text = _nothingTip;
    }
    _nothingTipLabel.hidden = _isHiddenNothing;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"WiseKitResource.bundle/wise_base_kit_return"] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonMethod)];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

/**
 * 导航栏左按钮
 */
- (void)leftButtonMethod{
    
    //预防快速连击
    self.navigationItem.leftBarButtonItem.enabled = false;
    [self performSelector:@selector(recoverButton) withObject:nil afterDelay:1.0f];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 * 恢复按钮可点
 */
- (void)recoverButton{
    
    self.navigationItem.leftBarButtonItem.enabled = true;
}


/**
 * 点击没数据的提示图
 */
- (void)clickNothingView
{
    
}

- (void)setNothingImageName:(NSString *)nothingImageName
{
    _nothingImageName = nothingImageName;
    if (_nothingImageView != nil) {
        [_nothingImageView setImage:[UIImage imageNamed:_nothingImageName]];
    }
}

- (void)setNothingTip:(NSString *)nothingTip
{
    _nothingTip = nothingTip;
    
    if (_nothingTipLabel != nil) {
        [_nothingTipLabel setText:_nothingTip];
    }
}

- (void)setIsHiddenNothing:(BOOL)isHiddenNothing
{
    _isHiddenNothing = isHiddenNothing;
    
    if (_nothingTipLabel != nil) {
        _nothingTipLabel.hidden = _isHiddenNothing;
    }
    
    if (_nothingImageView != nil)  {
         _nothingImageView.hidden = _isHiddenNothing;
    }
}


- (void)setReturnImageName:(NSString *)returnImageName
{
    _returnImageName = returnImageName;
    
    if (_returnImageName == nil) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:returnImageName] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonMethod)];
    }
}

//界面返回代理
- (void)controller:(UIViewController *)vc back:(BOOL)isSuccess
{
    [vc dismissViewControllerAnimated:true completion:nil];
}

@end
