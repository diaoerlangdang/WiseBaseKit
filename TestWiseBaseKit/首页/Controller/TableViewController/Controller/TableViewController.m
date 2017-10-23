//
//  TableViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/25.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "TableViewController.h"
#import "WWSegmentView.h"

@interface TableViewController ()

/** 数据 */
@property (nonatomic, strong) NSMutableArray<NSString *> *dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"TabViewController";
    
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:@"单行数据"];
    [_dataArray addObject:@"多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据多行数据"];
    
    //自动计算cell高度
    self.tableView.estimatedRowHeight = 100;
    
    //显示上拉加载
    self.showRefreshFooter = true;
    //显示下拉刷新
    self.showRefreshHeader = true;
    
}

- (void)refreshingHeader
{
    [self stopRefreshHeader];
}

- (void)refreshingFooter
{
    [self stopRefreshFooter];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.numberOfLines = 0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}


@end
