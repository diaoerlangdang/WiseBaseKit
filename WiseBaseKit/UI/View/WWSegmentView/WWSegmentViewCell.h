//
//  WWSegmentViewCell.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/9/27.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconButton.h"

@interface WWSegmentViewCell : UITableViewCell

/** 按钮 */
@property(nonatomic, strong) IconButton *iconBtn;

/** 是否选中 */
@property(nonatomic, assign) BOOL cellSelected;

@end
