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

/**  之前导航栏的透明度 */
@property (nonatomic, assign) CGFloat oldNavAlpha;

@end


@implementation WWBaseViewController

/**
 返回按钮默认图片
 */
static UIImage *_defaultReturnImage = nil;

+ (UIImage *)defaultReturnImage
{
    return _defaultReturnImage;
}

+ (void)setDefaultReturnImage:(UIImage *)defaultReturnImage
{
    _defaultReturnImage = defaultReturnImage;
}

/**
 背景默认颜色
 */
static UIColor *_defaultBgColor = nil;

+ (UIColor *)defaultBgColor
{
    return  _defaultBgColor;
}

+ (void)setDefaultBgColor:(UIColor *)defaultBgColor
{
    _defaultBgColor = defaultBgColor;
}

/**
 默认什么都没有显示的图片
 */
static UIImage *_defaultNoDataImage = nil;

+ (UIImage *)defaultNoDataImage
{
    return _defaultNoDataImage;
}

+ (void)setDefaultNoDataImage:(UIImage *)defaultNoDataImage
{
    _defaultNoDataImage = defaultNoDataImage;
}

/**
 默认什么都没有显示提示语
 */
static NSString *_defaultnoDataTip = @"";

+ (NSString *)defaultnoDataTip
{
    return _defaultnoDataTip;
}

+ (void)setDefaultnoDataTip:(NSString *)defaultnoDataTip
{
    _defaultnoDataTip = defaultnoDataTip;
}

/**
 默认错误显示的图片
 */
static UIImage *_defaultErrorImage = nil;

+ (UIImage *)defaultErrorImage
{
    return _defaultErrorImage;
}

+ (void)setDefaultErrorImage:(UIImage *)defaultErrorImage
{
    _defaultErrorImage = defaultErrorImage;
}

/**
 默认错误显示提示语
 */
static NSString *_defaultErrorTip = @"";

+ (NSString *)defaultErrorTip
{
    return _defaultErrorTip;
}

+ (void)setDefaultErrorTip:(NSString *)defaultErrorTip
{
    _defaultErrorTip = defaultErrorTip;
}

/**
 默认顶部图片
 */
static UIImage *_defaultTopImage = nil;

+ (UIImage *)defaultTopImage
{
    return _defaultTopImage;
}

+ (void)setDefaultTopImage:(UIImage *)defaultTopImage
{
    _defaultTopImage = defaultTopImage;
}

/**
 默认导航栏颜色
 */
static UIStatusBarStyle _defaultStatusBarStyle = UIStatusBarStyleDefault;

+ (UIStatusBarStyle)defaultStatusBarStyle
{
    return _defaultStatusBarStyle;
}

+ (void)setDefaultStatusBarStyle:(UIStatusBarStyle)defaultStatusBarStyle
{
    _defaultStatusBarStyle = defaultStatusBarStyle;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认不显示
        _showType = WWBaseKitShowType_Normal;
        
        _noDataTip = nil;
        _noDataImageName = nil;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.navigationBar.translucent = false;
//    self.tabBarController.tabBar.translucent = false;
    
    _topImageView = [UIImageView new];
    [self.view addSubview:_topImageView];
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
    if (_topImageName != nil) {
        _topImageView.image = [UIImage imageNamed:_topImageName];
    }
    else if (_defaultTopImage != nil) {
        _topImageView.image = _defaultTopImage;
    }
    
    _tipImageView = [UIImageView new];
    [self.view addSubview:_tipImageView];
    [_tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [_tipImageView addTapAction:self selector:@selector(clickTipView)];
    
    if (_noDataImageName != nil) {
        [_tipImageView setImage:[UIImage imageNamed:_noDataImageName]];
    }
    _tipImageView.hidden = (_showType == WWBaseKitShowType_Normal);
    
    _tipLabel = [UILabel new];
    _tipLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_tipLabel];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.tipImageView.mas_centerX);
        make.top.equalTo(self.tipImageView.mas_bottom).offset(10);
    }];
    
    [_tipLabel addTapAction:self selector:@selector(clickTipView)];
    if (_noDataTip != nil) {
        _tipLabel.text = _noDataTip;
    }
    _tipLabel.hidden = (_showType == WWBaseKitShowType_Normal);
    
    if (self.navigationController != nil && self.navigationController.viewControllers.count > 1) {
        
        NSString *backImageName = [NSString stringWithFormat:@"%@/wise_base_kit_return",[[NSBundle bundleForClass:[WWBaseViewController class]] pathForResource:@"WiseKitResource" ofType:@"bundle"]];
        
        UIImage *leftImage = (_defaultReturnImage != nil) ? _defaultReturnImage : [UIImage imageNamed:backImageName];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonMethod)];
    }
    
    if (_defaultBgColor != nil) {
        self.view.backgroundColor = _defaultBgColor;
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _oldNavAlpha = [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = _oldNavAlpha;
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
 * 点击提示图
 */
- (void)clickTipView
{
    
}

- (void)setShowType:(WWBaseKitShowType)showType
{
    _showType = showType;
    switch (showType) {
            
        case WWBaseKitShowType_NoData:
            _tipImageView.hidden = false;
            _tipLabel.hidden = false;
            
            if (_noDataTip != nil) {
                _tipLabel.text = _noDataTip;
            }
            else {
                _tipLabel.text = _defaultnoDataTip;
            }
            
            if (_noDataImageName != nil) {
                _tipImageView.image = [UIImage imageNamed:_noDataImageName];
            }
            else {
                _tipImageView.image = _defaultNoDataImage;
            }
            
            break;
            
        case WWBaseKitShowType_Error:
            _tipImageView.hidden = false;
            _tipLabel.hidden = false;
            
            if (_errorTip != nil) {
                _tipLabel.text = _errorTip;
            }
            else {
                _tipLabel.text = _defaultErrorTip;
            }
            
            if (_errorImageName != nil) {
                _tipImageView.image = [UIImage imageNamed:_errorImageName];
            }
            else {
                _tipImageView.image = _defaultErrorImage;
            }
            break;
            
        default:
            _tipImageView.hidden = true;
            _tipLabel.hidden = true;
            break;
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

- (void)setTopImageName:(NSString *)topImageName
{
    _topImageName = topImageName;
    _topImageView.image = [UIImage imageNamed:topImageName];
}

//界面返回代理
- (void)controller:(UIViewController *)vc back:(BOOL)isSuccess data:(NSDictionary *)data
{
    [vc dismissViewControllerAnimated:true completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _defaultStatusBarStyle;
}

@end
