//
//  NoDataViewController.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/10/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "NoDataViewController.h"

#define HEADER_VIEW_HEIGHT     200

@interface NoDataViewController ()

@property (nonatomic, assign) CGFloat alphaTmp;

@end

@implementation NoDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"页面";
    
    self.noDataTip = @"没东西,点击加载";
    self.tipLabel.textColor = [UIColor whiteColor];
    self.noDataImageName = @"no_data";
    
    self.showType = WWBaseKitShowType_NoData;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    _alphaTmp = 0;
    //自动计算header view 高度
    self.tableView.estimatedSectionHeaderHeight = HEADER_VIEW_HEIGHT;
    
    self.isNavBottom = false;
    self.tableView.backgroundColor = [UIColor clearColor];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_alphaTmp < 1) {
        [self.navigationController.navigationBar ww_setBackgroundColor:[UIColor clearColor]];
    }
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar ww_setBackgroundColor:WW_COLOR_HexRGB(0xee0000)];
    self.navigationController.navigationBar.shadowImage = nil;
}

- (void)clickTipView
{
    self.topImageName = @"1";
    self.showType = WWBaseKitShowType_Normal;
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"1"];
//    [self.view addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WW_SCREEN_WIDTH, HEADER_VIEW_HEIGHT)];
    headerView.backgroundColor = [UIColor clearColor];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MineTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = WW_COLOR_RANDOM;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y + self.tableView.contentInset.top;//注意
    
    if (offsetY > HEADER_VIEW_HEIGHT/2 && offsetY <= HEADER_VIEW_HEIGHT-WW_NAVIGATION_BAR_HEIGHT) {
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self setNeedsStatusBarAppearanceUpdate];
        }
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        _alphaTmp = offsetY/(HEADER_VIEW_HEIGHT * 2) >= 1 ? 1 : offsetY/(HEADER_VIEW_HEIGHT * 2);
        [self.navigationController.navigationBar ww_setBackgroundColor:WW_COLOR_RGBA(0xee, 00, 00, _alphaTmp)];
        
    }else if (offsetY <= HEADER_VIEW_HEIGHT/2) {
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self setNeedsStatusBarAppearanceUpdate];
        }
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        _alphaTmp = 0;
        [self.navigationController.navigationBar ww_setBackgroundColor:WW_COLOR_RGBA(0xee, 00, 00, _alphaTmp)];
        
    }else if (offsetY > HEADER_VIEW_HEIGHT +WW_NAVIGATION_BAR_HEIGHT) {
        _alphaTmp = 1;
        [self.navigationController.navigationBar ww_setBackgroundColor:WW_COLOR_RGBA(0xee, 00, 00, _alphaTmp)];
    }
    
    if (offsetY < 0) {
        self.topImageView.transform = CGAffineTransformMakeScale(1 + offsetY/(-200), 1 + offsetY/(-200));
        CGRect frame = self.topImageView.frame;
        frame.origin.y = 0;
        self.topImageView.frame = frame;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击%ld",indexPath.row);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (_alphaTmp < 0.5) {
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
}

@end
