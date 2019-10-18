//
//  WWBaseScrollViewController.h
//  TestWiseBaseKit
//
//  Created by 吴睿智 on 2019/10/18.
//  Copyright © 2019 wuruizhi. All rights reserved.
//

#import "WWBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWBaseScrollViewController : WWBaseViewController

// 滑动view
@property (nonatomic, strong) UIScrollView *scrollView;

// 内容view
@property (nonatomic, strong) UIView *contentView;

@end

NS_ASSUME_NONNULL_END
