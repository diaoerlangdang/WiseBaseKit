//
//  ScaleButton.h
//  Navigation
//
//  Created by simba on 11-1-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIEdgeOffsetsZero UIEdgeOffsetsMake(0, 0, 0, 0)

// IconButton is used to change the layout behavior of UIButton.
// Icon is put on the left and label on the right for IconButtonStyleIconLeft style.
// +---------------------+
// | +------+            |
// | |      |            |
// | | Icon |    Text    |
// | |      |            |
// | +------+            |
// +---------------------+

typedef enum
{
	IconButtonStyleIconLeft,
	IconButtonStyleIconRight,
    IconButtonStyleIconCenter,
	IconButtonStyleIconTop,
	IconButtonStyleIconBottom
} IconButtonStyle;

typedef struct UIEdgeOffsets
{
    CGFloat left, top, width, height;
} UIEdgeOffsets;

static inline UIEdgeOffsets UIEdgeOffsetsMake(CGFloat left, CGFloat top, CGFloat width, CGFloat height)
{
	UIEdgeOffsets offsets = {left, top, width, height};
	return offsets;
}
static inline CGRect UIEdgeOffsetsRect(CGRect rect, UIEdgeOffsets offsets)
{
	rect.origin.x    += offsets.left;
	rect.origin.y    += offsets.top;
	rect.size.width  += offsets.width;
	rect.size.height += offsets.height;
	return rect;
}
@interface IconButton : UIButton
{
	IconButtonStyle _iconStyle;
	UIEdgeOffsets   _titleEdgeOffsets;
	UIEdgeOffsets   _imageEdgeOffsets;
}

@property (nonatomic) IconButtonStyle   iconStyle;
@property(nonatomic)  UIEdgeOffsets     imageEdgeOffsets;              // default is UIEdgeOffsetsZero
@property(nonatomic)  UIEdgeOffsets     titleEdgeOffsets;              // default is UIEdgeOffsetsZero

@property (nonatomic,assign)CGSize fixImageViewSize;

- (id)initWithFrame:(CGRect)frame style:(IconButtonStyle)style;

@end
