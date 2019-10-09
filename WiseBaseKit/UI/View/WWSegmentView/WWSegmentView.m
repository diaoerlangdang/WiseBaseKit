//
//  WWSegmentView.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/26.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWSegmentView.h"
#import <Masonry/Masonry.h>
#import "UIView+WWExtend.h"
#import "WWSegmentViewCell.h"
#import "WWColorFontDefines.h"
#import "UIImage+WWColor.h"

@interface WWSegmentView()<UITableViewDelegate, UITableViewDataSource>

/** tableview */
@property(nonatomic, strong) UITableView *tableView;

/** 底部横线 */
@property(nonatomic, strong) UIView *bottomLineView;

@end

@implementation WWSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        
        [self initView];
    }
    
    return self;
}

/** 初始化界面 */
- (void)initView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_height);
        make.height.equalTo(self.mas_width);
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    _tableView.bounces = false;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = false;
    _tableView.showsHorizontalScrollIndicator = false;
    
    if (@available(iOS 11.0, *)) {
        //设置为0，禁止自动计算cell高度
        _tableView.estimatedRowHeight = 0;
        //设置为0，禁止自动计算footer高度
        _tableView.estimatedSectionFooterHeight = 0;
        //设置为0，禁止自动计算header高度
        _tableView.estimatedSectionHeaderHeight = 0;
        //默认footer header都有内边距
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    _bottomLineView = [[UIView alloc] init];
    [_tableView addSubview:_bottomLineView];
    _bottomLineView.backgroundColor = _bottomLineColor;
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@2);
        make.top.equalTo(self.tableView.mas_top);
        make.left.equalTo(self.tableView.mas_left);
    }];
}

/** 初始化数据 */
- (void)initData
{
    _titleWidth = -1.f;
    
    _titlePaddingWidth = 30.f;
    
    _titleFont = WW_Font(16);
    
    _selectTitleFont = WW_Font(16);
    
    _titleArray = [NSArray array];
    
    _iconPostion = WWSegmentViewIconPostion_Left;
    
    _selectIndex = 0;
    
    _titleColor = WW_COLOR_HexRGB(0x333333);
    
    _bottomLineType = WWSegmentViewBottomLineType_Defalut;
    
    _selectTitleColor = WW_COLOR_HexRGB(0x77A9FD);
    
    _bottomLineColor = WW_COLOR_HexRGB(0x77A9FD);
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor
{
    _selectTitleColor = selectTitleColor;
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor
{
    _bottomLineColor = bottomLineColor;
    _bottomLineView.backgroundColor = bottomLineColor;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    if (_selectIndex == selectIndex) {
        return;
    }
    
    _selectIndex = selectIndex;
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:selectIndex inSection:0];
    [_tableView reloadData];
    [_tableView selectRowAtIndexPath:path animated:true scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)updateConstraints
{
    [super updateConstraints];
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"SegmentCell";
    WWSegmentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [[WWSegmentViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // cell顺时针旋转90度
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        
        cell.backgroundColor = [UIColor clearColor];
    }
    
    //标题
    [cell.iconBtn setTitle:_titleArray[indexPath.row] forState:UIControlStateNormal];
    [cell.iconBtn setTitle:_titleArray[indexPath.row] forState:UIControlStateSelected];
    
    //标题字体
    cell.iconBtn.titleLabel.font = _titleFont;
    
    //icon    
    [cell.iconBtn setImage:_titleIcon forState:UIControlStateNormal];
    [cell.iconBtn setImage:_selectTitleIcon forState:UIControlStateSelected];
    
    //标题颜色
    [cell.iconBtn setTitleColor:_titleColor forState:UIControlStateNormal];
    [cell.iconBtn setTitleColor:_selectTitleColor forState:UIControlStateSelected];
    
//    switch (_iconPostion) {
//        case WWSegmentViewIconPostion_Right:
//            [cell.iconBtn setIconStyle:IconButtonStyleIconRight];
//            break;
//        default:
//            [cell.iconBtn setIconStyle:IconButtonStyleIconLeft];
//            break;
//    }
    
    if (indexPath.row == _selectIndex) {
        cell.cellSelected = true;
        
        //标题字体
        cell.iconBtn.titleLabel.font = _selectTitleFont;
        
        CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
        //如果其约束还没有生成的时候需要动画的话，就请先强制刷新后才写动画，否则所有没生成的约束会直接跑动画
        [_tableView layoutIfNeeded];
        [cell.iconBtn layoutIfNeeded];
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.bottomLineView mas_updateConstraints:^(MASConstraintMaker *make) {
                if (self.bottomLineType == WWSegmentViewBottomLineType_Defalut) {
                    make.top.equalTo(self.tableView.mas_top).offset(rectInTableView.origin.y+(rectInTableView.size.height - cell.iconBtn.width)/2);
                    make.height.equalTo(@(cell.iconBtn.width));
                }
                else {
                    make.top.equalTo(self.tableView.mas_top).offset(rectInTableView.origin.y);
                    make.height.equalTo(@(rectInTableView.size.height));
                }
            }];
            
            //强制绘制
            [self.tableView layoutIfNeeded];
        }];
    }
    else {
        cell.cellSelected = false;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeight:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegate != nil && [_delegate respondsToSelector:@selector(segmentView:oldIndex:newIndex:)]) {
        [_delegate segmentView:self oldIndex:_selectIndex newIndex:indexPath.row];
    }
    
    if (indexPath.row != _selectIndex) {
        
        _selectIndex = indexPath.row;
        [_tableView reloadData];
        
        [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:true];
    }
}

/**
 *  获取cell高度
 *
 *  @param index index
 *
 *  @return 高度
 */
- (CGFloat)getCellHeight:(NSInteger)index
{
    if (_titleWidth < 0) {
        
        IconButton *iconBtn = [[IconButton alloc] initWithFrame:CGRectZero style:IconButtonStyleIconLeft];
        [iconBtn setTitleEdgeOffsets:UIEdgeOffsetsMake(5, 0, -10, 0)];
        [iconBtn setTitle:_titleArray[index] forState:UIControlStateNormal];
        //icon
        if (_titleIcon != nil) {
            [iconBtn setImage:_titleIcon forState:UIControlStateNormal];
        }
        if (_selectTitleIcon != nil) {
            [iconBtn setImage:_selectTitleIcon forState:UIControlStateSelected];
        }
        
        [iconBtn sizeToFit];
        
        return iconBtn.width+_titlePaddingWidth;
    }
    else {
        return _titleWidth;
    }
}


@end
