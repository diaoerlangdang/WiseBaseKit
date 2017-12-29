//
//  MainPageViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "MainPageViewController.h"
#import "WebViewController.h"
#import "FragmentController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"

@interface MainPageViewController ()

@property (nonatomic, strong) NSMutableArray<NSString *> *dataArray;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:@"WebViewController"];
    [_dataArray addObject:@"FragmentController-横向"];
    [_dataArray addObject:@"FragmentController-纵向"];
    [_dataArray addObject:@"TableViewController"];
    [_dataArray addObject:@"CollectionViewController"];
    
    //自动计算cell高度
    self.tableView.estimatedRowHeight = 100;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MainPageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    WWBaseViewController *vc = nil;
    switch (indexPath.row) {
        //网页
        case 0:
            vc = [[WebViewController alloc] init];
            ((WebViewController*) vc).urlString = @"https://www.jianshu.com";
            break;
            
        //FragmentController-横向
        case 1:
            vc = [[FragmentController alloc] init];
            break;
            
        //FragmentController-纵向
        case 2:
            [self.view makeToast:@"敬请期待..."];
            
            break;
            
        //TableViewController
        case 3:
            vc = [[TableViewController alloc] init];
            break;
            
        //CollectionViewController
        case 4:
            vc = [[CollectionViewController alloc] init];
            break;
            
        default:
            break;
    }
    
    if (vc != nil) {
        [self.navigationController pushViewController:vc animated:true];
    }
}

@end
