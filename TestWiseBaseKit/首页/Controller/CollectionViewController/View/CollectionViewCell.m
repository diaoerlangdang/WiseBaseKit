//
//  CollectionViewCell.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "CollectionViewCell.h"
#import "WiseBaseKit.h"

@interface CollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _highLight = false;
        self.backgroundColor = WW_COLOR_HexRGB(0xf0f0f0);
        
        _titleLabel = [UILabel new];
        _titleLabel.font = WW_Font(15);
        _titleLabel.textColor = WW_COLOR_HexRGB(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setHighLight:(BOOL)highLight
{
    _highLight = highLight;
    if (_highLight) {
        self.backgroundColor = WW_COLOR_HexRGB(0x0573b7);
        _titleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.backgroundColor = WW_COLOR_HexRGB(0xf0f0f0);
        _titleLabel.textColor = WW_COLOR_HexRGB(0x333333);
    }
}

/**
 *  获取cell尺寸
 *
 *  @param data 数据
 *
 *  @return 尺寸
 */
+ (CGSize)getCellSize:(NSString *)data
{
    UILabel *label = [UILabel new];
    label.font = WW_Font(15);
    label.text = data;
    [label sizeToFit];
    return CGSizeMake(label.width+20, label.height+10);
}

@end
