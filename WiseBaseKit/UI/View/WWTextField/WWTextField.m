//
//  WWTextField.m
//  OASystem
//
//  Created by wuruizhi on 2018/5/2.
//  Copyright © 2018年 wuruizhi. All rights reserved.
//

#import "WWTextField.h"

@implementation WWTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 当UITextView的文字发生改变时，UITextView自己会发出一个UITextViewTextDidChangeNotification通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self];
        
    }
    return self;
}

-(void)textFieldEditChanged:(NSNotification *)obj
{
    if (_maxLength == 0) {
        _maxLength = 10000;
    }
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > _maxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_maxLength];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:_maxLength
                                  ];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _maxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
    [attr addAttribute:NSForegroundColorAttributeName value:placeholderColor range:NSMakeRange(0, self.placeholder.length)];
    
    self.attributedPlaceholder = attr;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    _placeholderFont = placeholderFont;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
    [attr addAttribute:NSFontAttributeName
                     value:placeholderFont
                     range:NSMakeRange(0, self.placeholder.length)];
    self.attributedPlaceholder = attr;
}

/// 设置placeHolder 信息， 若颜色与字体都需要更改建议使用该方法
/// @param placeHolder placeHolder信息
/// @param color placeHolder 颜色
/// @param font placeHolder 字体
- (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)color font:(UIFont *)font
{
    _placeholderColor = color;
    _placeholderFont = font;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:placeHolder];
    [attr addAttribute:NSFontAttributeName
                     value:font
                     range:NSMakeRange(0, placeHolder.length)];
    [attr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, placeHolder.length)];
    self.attributedPlaceholder = attr;
}


@end
