//
//  CollectionViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "CollectionViewController.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()

/** 数据 */
@property (nonatomic, strong) NSMutableArray<NSString *> *dataArray;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CollecionViewController";
    
    _dataArray = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"数据%d",i+1]];
    }
    [_dataArray addObject:[NSString stringWithFormat:@"长数据数据数据22"]];
    
    //显示上拉加载
    self.showRefreshFooter = true;
    //显示下拉刷新
    self.showRefreshHeader = true;
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
}

//可不实现，不实现，默认一个布局
- (UICollectionViewFlowLayout *)collectionViewFlowLayout
{
    return [[UICollectionViewLeftAlignedLayout alloc] init];
}

#pragma mark - Collection View data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = nil;
    
    NSString *const collectionVideoIdentify = @"CollectionViewCell";
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionVideoIdentify forIndexPath:indexPath];
    
    cell.title = _dataArray[indexPath.row];
    
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [CollectionViewCell getCellSize:_dataArray[indexPath.row]];
    
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 33, 0, 33);//分别为上、左、下、右
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell  = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.highLight = true;
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell  = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.highLight = false;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *kindInfo = _dataArray[indexPath.row];
    
    WWLog(@"点击 %@",kindInfo);
}

/**
 *  正在下拉刷新，子类可重写实现
 */
- (void)refreshingHeader
{
    [self stopRefreshHeader];
}

/**
 *  正在上拉刷新，子类可重写实现
 */
- (void)refreshingFooter
{
    [self stopRefreshFooter];
}

@end
