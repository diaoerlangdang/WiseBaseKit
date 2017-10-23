//
//  WWCryptoUtils.h
//  CryptoTest
//
//  Created by wuruizhi on 2017/2/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWCryptoUtils : NSObject


/**
 *  des加密后base64加密
 *
 *  @param plainText    明文数据
 *  @param iv           初始向量，可为NULL，表示ECB模式；不为空则必须为8个字节，表示CBC模式
 *  @param key          密钥，可为8/16/24字节,8字节表示单DES，16字节表示双DES，24表示3DES
 *
 *  @return 成功返回密文数据，失败返回NULL
 */
+ (nullable NSString *) desEncrypt:(nonnull NSString *)plainText initVector:(nullable NSData *)iv key:(nonnull NSData *)key;


/**
 *  base64解密后des解密
 *
 *  @param cipherText   密文数据
 *  @param iv           初始向量，可为NULL，表示ECB模式；不为空则必须为8个字节，表示CBC模式
 *  @param key          密钥，可为8/16/24字节,8字节表示单DES，16字节表示双DES，24表示3DES
 *
 *  @return 成功返回明文数据，失败返回NULL
 */
+ (nullable NSString *) desDecrypt:(nonnull NSString*)cipherText initVector:(nullable NSData *)iv key:(nonnull NSData*)key;

/**
 *  获取md5
 *
 *  @param data 源数据
 *
 *  @return md5值
 */
+ (NSString *_Nullable)getMD5:(NSString *_Nonnull)data;

@end
