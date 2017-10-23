//
//  WWSegmentViewCell.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/27.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWSegmentViewCell.h"
#import <Masonry/Masonry.h>
#import "WWColorFontDefines.h"

@interface WWSegmentViewCell()

@end


@implementation WWSegmentViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    
    return self;
}

/** 初始化界面 */
- (void)initView
{
    _iconBtn = [[IconButton alloc] initWithFrame:CGRectZero style:IconButtonStyleIconLeft];
    [self.contentView addSubview:_iconBtn];
    [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    [_iconBtn setTitleEdgeOffsets:UIEdgeOffsetsMake(5, 0, -10, 0)];
    
    _iconBtn.userInteractionEnabled = false;
}

- (void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    _iconBtn.selected = cellSelected;
}

@end
