//
//  WWRegexUtils.h
//  TestWiseBaseKit
//
//  Created by wuruizhi on 2017/8/30.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWRegexUtils : NSObject

/**
 *  正则表达式的简单封装，判断是否满足条件
 *
 *  @param regex 表达式
 *  @param value 要验证的数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidateByRegex:(NSString *)regex value:(NSString *)value;


/**
 *  是否为手机号
 *
 *  @param mobileNum 手机号
 *
 *  @return 是true，否false
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  判断是否为邮箱
 *
 *  @param email 邮箱
 *
 *  @return 是true，否false
 */
+ (BOOL)isEmailAddress:(NSString *)email;

/**
 *  简单的身份证号判断
 *
 *  @param cardNum 身份证号
 *
 *  @return 是true，否false
 */
+ (BOOL)simpleVerifyIdentityCardNum:(NSString *)cardNum;


/**
 *  精确的身份证号码有效性检测
 *
 *  @param cardNum 身份证号
 *
 *  @return 满足true，否则false
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)cardNum;



/**
 *  密码是否有效,数字 + 字母，只能包含“字母”，“数字”
 *
 *  @param password     密码
 *  @param minLen       最小长度
 *  @param maxLen       最大长度
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidPassword:(NSString *)password min:(int)minLen max:(int)maxLen;

/**
 *  是否为纯汉字
 *
 *  @param data     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isValidChinese:(NSString *)data;


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
+ (BOOL)isValidBankCardLuhn:(NSString *)cardNum;


/**
 *  判断是否以字母开头
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isEnglishFirst:(NSString *)str;


/**
 *  判断是否以汉字开头
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isChineseFirst:(NSString *)str;


/**
 *  判断是否为纯数字
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isNumber:(NSString *)str;

/**
 *  判断是否为全字母
 *
 *  @param str     数据
 *
 *  @return 满足true，否则false
 */
+ (BOOL)isAlphabet:(NSString *)str;


@end
