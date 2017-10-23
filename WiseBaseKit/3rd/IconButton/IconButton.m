//
//  ScaleButton.m
//  Navigation
//
//  Created by simba on 11-1-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IconButton.h"

#define IBTopBottomMargin 2
#define IBLeftRightMargin 2

@implementation IconButton
{
    UIImageView *_innerImageView;
    UILabel *_innerLabel;
}

@synthesize iconStyle = _iconStyle;
@synthesize imageEdgeOffsets = _imageEdgeOffsets;
@synthesize titleEdgeOffsets = _titleEdgeOffsets;

- (id)initWithFrame:(CGRect)frame style:(IconButtonStyle)style
{
	self = [self initWithFrame:frame];
	if (self)
	{
		_iconStyle = style;
        self.exclusiveTouch = YES;
        
        _innerImageView = self.imageView;
        _innerLabel = self.titleLabel;
	}
	return self;
}
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		_iconStyle = IconButtonStyleIconLeft;
		_imageEdgeOffsets = UIEdgeOffsetsZero;
		_titleEdgeOffsets = UIEdgeOffsetsZero;
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		self.titleLabel.adjustsFontSizeToFitWidth = YES;
		self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.exclusiveTouch = YES;
        
        _innerImageView = self.imageView;
        _innerLabel = self.titleLabel;
	}
	return self;
}
-(void)sizeToFit
{
    [self layoutSubviews];
	CGSize szImage = _innerImageView.image.size;
	CGSize szFrame;    
    CGSize szText = [_innerLabel.text sizeWithAttributes:@{NSFontAttributeName:_innerLabel.font}];
	if (_iconStyle == IconButtonStyleIconLeft
		|| _iconStyle == IconButtonStyleIconRight|| _iconStyle == IconButtonStyleIconCenter)
	{
        szFrame.width = IBLeftRightMargin + szImage.width + _imageEdgeOffsets.left + _imageEdgeOffsets.width + szText.width + _titleEdgeOffsets.left + _titleEdgeOffsets.width;
		szFrame.height = IBTopBottomMargin + MAX(szImage.height + _imageEdgeOffsets.top + _imageEdgeOffsets.height,
                                                 szText.height + _titleEdgeOffsets.top + _titleEdgeOffsets.height);
	}
    else
	{
        szFrame.width = IBLeftRightMargin + MAX(szImage.width + _imageEdgeOffsets.left + _imageEdgeOffsets.width,
                                                szText.width + _titleEdgeOffsets.left + _titleEdgeOffsets.width);
		szFrame.height = IBTopBottomMargin + szImage.height + _imageEdgeOffsets.top + _imageEdgeOffsets.height + szText.height + _titleEdgeOffsets.top + _titleEdgeOffsets.height;
	}
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, szFrame.width, szFrame.height);
}

- (void) layoutSubviews
{
	[super layoutSubviews];
    
	if (CGRectIsEmpty(self.bounds))
		return;
    
    CGSize szImage = _innerImageView.image.size;
    if (!CGSizeEqualToSize(CGSizeZero, self.fixImageViewSize)) {
        szImage = self.fixImageViewSize;
    }

	CGSize szFrame = self.bounds.size;
	CGRect rcIconFrame, rcTextFrame;
    
	if (_iconStyle == IconButtonStyleIconLeft
		|| _iconStyle == IconButtonStyleIconRight|| _iconStyle == IconButtonStyleIconCenter)
	{
		CGFloat y = (szFrame.height - szImage.height - IBTopBottomMargin) / 2;
		if (_iconStyle == IconButtonStyleIconLeft)
		{
			rcIconFrame = CGRectMake(IBLeftRightMargin / 2, IBTopBottomMargin / 2  + y, szImage.width, szImage.height);
			rcTextFrame = CGRectMake(IBLeftRightMargin + szImage.width, IBTopBottomMargin / 2, szFrame.width - (IBLeftRightMargin * 1.5 + szImage.width), szFrame.height - IBTopBottomMargin);
		}
		else if (_iconStyle == IconButtonStyleIconRight)
		{
			rcTextFrame = CGRectMake(IBLeftRightMargin / 2 , IBTopBottomMargin / 2, szFrame.width - (IBLeftRightMargin * 1.5 + szImage.width),
                                         szFrame.height - IBTopBottomMargin);
			rcIconFrame = CGRectMake(IBLeftRightMargin + rcTextFrame.size.width, IBTopBottomMargin / 2 + y, szImage.width, szImage.height);

		}else{
            CGSize szText = [_innerLabel.text sizeWithAttributes:@{NSFontAttributeName:_innerLabel.font}];
            CGFloat x = ((szFrame.width  - szText.width - IBLeftRightMargin) / 2 - szImage.width)*0.75;
            rcIconFrame = CGRectMake(IBLeftRightMargin/2+x, IBTopBottomMargin / 2  + y, szImage.width, szImage.height);
			rcTextFrame = CGRectMake(IBLeftRightMargin + szImage.width, IBTopBottomMargin / 2, szFrame.width - (IBLeftRightMargin * 1.5 + szImage.width), szFrame.height - IBTopBottomMargin);
        }
	}
    else
	{
		CGFloat x = (szFrame.width - szImage.width - IBLeftRightMargin) / 2;
		if (_iconStyle == IconButtonStyleIconTop)
		{
			rcIconFrame = CGRectMake(IBLeftRightMargin / 2 + x, IBTopBottomMargin / 2, szImage.width, szImage.height);
			rcTextFrame = CGRectMake(IBLeftRightMargin / 2, IBTopBottomMargin + szImage.height, szFrame.width - IBLeftRightMargin, szFrame.height - (IBTopBottomMargin * 1.5 + szImage.height));
		}
		else
		{
			rcTextFrame = CGRectMake(IBLeftRightMargin / 2, IBTopBottomMargin / 2, szFrame.width - IBLeftRightMargin * 2,
                                         szFrame.height - (IBTopBottomMargin * 1.5 + szImage.height));
			rcIconFrame = CGRectMake(IBLeftRightMargin / 2 + x, IBTopBottomMargin + rcTextFrame.size.height, szImage.width, szImage.height);
		}
	}
    
	rcIconFrame = UIEdgeOffsetsRect(rcIconFrame, _imageEdgeOffsets);
	rcTextFrame = UIEdgeOffsetsRect(rcTextFrame, _titleEdgeOffsets);
    
	if (!CGRectIsEmpty(rcIconFrame))
		_innerImageView.frame = rcIconFrame;
	if (!CGRectIsEmpty(rcTextFrame))
		_innerLabel.frame = rcTextFrame;
}


@end
