//
//  Fragment.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/28.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "Fragment.h"

@interface Fragment ()

@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation Fragment

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tipLabel = [UILabel new];
    _tipLabel.textColor = [UIColor whiteColor];
    _tipLabel.text = _tips;
    [self.view addSubview:_tipLabel];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    self.view.backgroundColor = [self randomColor];
    
}

- (void)willShowCurrentFragment
{
    
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
