//
//  WWTableView.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/12/4.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWTableView.h"

@implementation WWTableView

static UIColor *_defaultBgColor = nil;

+ (UIColor *)defaultBgColor
{
    return _defaultBgColor;
}

+ (void)setDefaultBgColor:(UIColor *)defaultBgColor
{
    _defaultBgColor = defaultBgColor;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        if (_defaultBgColor != nil) {
            self.backgroundColor = _defaultBgColor;
        }
        
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        self.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    }
    
    return self;
}

@end
