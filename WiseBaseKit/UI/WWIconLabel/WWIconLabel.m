//
//  WWIconLabel.m
//  OASystem
//
//  Created by 吴睿智 on 2018/5/8.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import "WWIconLabel.h"

@interface WWIconLabel()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation WWIconLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self updateView];
    }
    
    return self;
}

- (void)updateView
{
    _contentView = [UIView new];
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIImageView *iconImgView = [UIImageView new];
//    iconImgView.image = [UIImage imageNamed:icon];
    [_contentView addSubview:iconImgView];
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
    _iconView = iconImgView;
    
    UILabel *textLabel = [UILabel labelWithTextColor:[UIColor whiteColor] font:WW_Font(10)];
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImgView.mas_right).offset(4);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    _textLabel = textLabel;
}

@end
