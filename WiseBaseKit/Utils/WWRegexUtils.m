//
//  WWRegexUtils.m
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWRegexUtils.h"

@implementation WWRegexUtils

/**
 *  正则表达式的简单封装，判断是否满足条件
 *
 *  @param regex 表达式
 *  @param value 要验证的数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidateByRegex:(NSString *)regex value:(NSString *)value
{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:value];
}

/**
 *  是否为手机号
 *
 *  @param mobileNum 手机号
 *
 *  @return 是true，否false
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
        
    }
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  判断是否为邮箱
 *
 *  @param email 邮箱
 *
 *  @return 是true，否false
 */
+ (BOOL)isEmailAddress:(NSString *)email
{
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex value:email];
}


/**
 *  简单的身份证号判断
 *
 *  @param cardNum 身份证号
 *
 *  @return 是true，否false
 */
+ (BOOL)simpleVerifyIdentityCardNum:(NSString *)cardNum
{
    NSString *regex2 = @"^(\\\\d{14}|\\\\d{17})(\\\\d|[xX])$";
    return [self isValidateByRegex:regex2 value:cardNum];
}


/**
 *  精确的身份证号码有效性检测
 *
 *  @param cardNum 身份证号
 *
 *  @return 满足true，否则false
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)cardNum
{
    
    cardNum = [cardNum stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!cardNum) {
        return NO;
    }else {
        length = (int)cardNum.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [cardNum substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [cardNum substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:cardNum
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, cardNum.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [cardNum substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:cardNum
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, cardNum.length)];
            
            if(numberofMatch >0) {
                int S = ([cardNum substringWithRange:NSMakeRange(0,1)].intValue + [cardNum substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([cardNum substringWithRange:NSMakeRange(1,1)].intValue + [cardNum substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([cardNum substringWithRange:NSMakeRange(2,1)].intValue + [cardNum substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([cardNum substringWithRange:NSMakeRange(3,1)].intValue + [cardNum substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([cardNum substringWithRange:NSMakeRange(4,1)].intValue + [cardNum substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([cardNum substringWithRange:NSMakeRange(5,1)].intValue + [cardNum substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([cardNum substringWithRange:NSMakeRange(6,1)].intValue + [cardNum substringWithRange:NSMakeRange(16,1)].intValue) *2 + [cardNum substringWithRange:NSMakeRange(7,1)].intValue *1 + [cardNum substringWithRange:NSMakeRange(8,1)].intValue *6 + [cardNum substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[cardNum substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}


/**
 *  密码是否有效,数字 + 字母，只能包含“字母”，“数字”
 *
 *  @param password     密码
 *  @param minLen       最小长度
 *  @param maxLen       最大长度
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidPassword:(NSString *)password min:(int)minLen max:(int)maxLen
{
    //数字 + 字母，只能包含“字母”，“数字”
    NSString *regex = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%d,%d}$",minLen,maxLen];
    return [self isValidateByRegex:regex value:password];
}

/**
 *  是否为纯汉字
 *
 *  @param data     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidChinese:(NSString *)data
{
//    NSString *chineseRegex = @"^[\\u4e00-\\u9fa5]+$";
//    return [self isValidateByRegex:chineseRegex value:data];
    
    NSString *pattern = @"^[\\u4e00-\\u9fa5]+$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:data];
    // 这里是后期补充的内容:九宫格判断
    if (!isMatch) {
        
        if ([WWRegexUtils isNumber:data]) {
            return NO;
        }
        NSString *other = @"➋➌➍➎➏➐➑➒";
        unsigned long len=data.length;
        for(int i=0;i<len;i++)
        {
            unichar a=[data characterAtIndex:i];
            if(!((isalpha(a))
                 ||(isalnum(a))
                 ||((a=='_') || (a == '-'))
                 ||((a >= 0x4e00 && a <= 0x9fa6))
                 ||([other rangeOfString:data].location != NSNotFound)
                 ))
                return NO;
        }
        return YES;
        
    }
    return isMatch;
}

/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 *
 *  @param cardNum     银行卡号
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidBankCardLuhn:(NSString *)cardNum
{
    NSString * lastNum = [[cardNum substringFromIndex:(cardNum.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[cardNum substringToIndex:(cardNum.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}

/**
 *  判断是否以字母开头
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isEnglishFirst:(NSString *)str
{
    NSString *regular = @"^[A-Za-z].+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    
    if ([predicate evaluateWithObject:str] == YES){
        return YES;
    }else{
        return NO;
    }
}


/**
 *  判断是否以汉字开头
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isChineseFirst:(NSString *)str
{
    int utfCode = 0;
    void *buffer = &utfCode;
    NSRange range = NSMakeRange(0, 1);
    BOOL b = [str getBytes:buffer maxLength:2 usedLength:NULL encoding:NSUTF16LittleEndianStringEncoding options:NSStringEncodingConversionExternalRepresentation range:range remainingRange:NULL];
    if (b && (utfCode >= 0x4e00 && utfCode <= 0x9fa5)){
        return YES;
    }else{
        return NO;
    }
}


/**
 *  判断是否为纯数字
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}


/**
 *  判断是否为全字母
 *
 *  @param str     数字
 *
 *  @return 满足true，否则false
 */

+ (BOOL)isAlphabet:(NSString *)str;
{
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}



@end
