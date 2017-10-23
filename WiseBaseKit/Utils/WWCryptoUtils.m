//
//  CryptoUtils.m
//  CryptoTest
//
//  Created by wuruizhi on 2017/2/23.
//  Copyright © 2017年 wuruizhi. All rights reserved.
//

#import "WWCryptoUtils.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <Security/Security.h>

//一次加密的最大数据长度
#define CryptoUtils_DES_BLOCK_SIZE_MAX      256

@implementation WWCryptoUtils


/**
 *  des加密后base64加密
 *
 *  @param plainText    明文数据
 *  @param iv           初始向量，可为NULL，表示ECB模式；不为空则必须为8个字节，表示CBC模式
 *  @param key          密钥，可为8/16/24字节,8字节表示单DES，16字节表示双DES，24表示3DES
 *
 *  @return 成功返回密文数据，失败返回NULL
 */
+ (nullable NSString *) desEncrypt:(nonnull NSString *)plainText initVector:(nullable NSData *)iv key:(nonnull NSData *)key
{
    
    NSString *ciphertext = nil;
    
    NSMutableData *textBytes = [NSMutableData dataWithData:[plainText dataUsingEncoding:NSUTF8StringEncoding]];
    
    unsigned char buffer[CryptoUtils_DES_BLOCK_SIZE_MAX];
    memset(buffer, 0, sizeof(buffer));
    Byte *pIv = NULL;
    size_t numBytesEncrypted = 0;
    CCAlgorithm algMode = kCCAlgorithmDES;
    NSMutableData *newKey = [NSMutableData data];
    
    //向量有值，则长度必须为8
    if (iv != nil && iv.length != 8) {
        return nil;
    } else {
        pIv = (Byte *)(iv.bytes);
    }
    
    //密钥长度只能为8/16/24
    switch (key.length) {
        case 8:
            algMode = kCCAlgorithmDES;
            [newKey appendData:key];
            break;
            
        case 16:
            algMode = kCCAlgorithm3DES;
            [newKey appendData:key];
            [newKey appendBytes:key.bytes length:8];
            break;
            
        case 24:
            algMode = kCCAlgorithm3DES;
            [newKey appendData:key];
            break;
            
        default:
            return nil;
            break;
    }
    
    //补位长度
    int paddingLen = 8 - textBytes.length%8;
    Byte paddingData[8] = {0};
    for (int i=0; i<paddingLen; i++) {
        paddingData[i] = (Byte)paddingLen;
    }
    
    //pkcs7 补位方式，保证要加密的数据长度为8的倍数
    [textBytes appendBytes:paddingData length:paddingLen];
    
    NSMutableData *resultData = [NSMutableData data];
    NSMutableData *tempData = [NSMutableData data];
    CCCryptorStatus cryptStatus = kCCParamError;
    
    for (int i=0; i<textBytes.length/CryptoUtils_DES_BLOCK_SIZE_MAX; i++) {
        
        numBytesEncrypted = 0;
        tempData = [NSMutableData dataWithBytes:textBytes.bytes+i*CryptoUtils_DES_BLOCK_SIZE_MAX length:CryptoUtils_DES_BLOCK_SIZE_MAX];
        
        cryptStatus = CCCrypt(kCCEncrypt, algMode,
                              0x00,//no padding
                              [newKey bytes], newKey.length,
                              pIv,
                              tempData.bytes, tempData.length,
                              buffer, CryptoUtils_DES_BLOCK_SIZE_MAX,
                              &numBytesEncrypted);
        
        if (cryptStatus == kCCSuccess) {
            NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
            [resultData appendData:data];
        }
        else {
            return nil;
        }
    }
    
    if (textBytes.length%CryptoUtils_DES_BLOCK_SIZE_MAX != 0) {
        
        numBytesEncrypted = 0;
        tempData = [NSMutableData dataWithBytes:textBytes.bytes+(textBytes.length - textBytes.length%CryptoUtils_DES_BLOCK_SIZE_MAX) length:textBytes.length%CryptoUtils_DES_BLOCK_SIZE_MAX];
        
        cryptStatus = CCCrypt(kCCEncrypt, algMode,
                              0x00,//no padding
                              [newKey bytes], newKey.length,
                              pIv,
                              tempData.bytes, tempData.length,
                              buffer, CryptoUtils_DES_BLOCK_SIZE_MAX,
                              &numBytesEncrypted);
        
        if (cryptStatus == kCCSuccess) {
            
            NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
            [resultData appendData:data];
            
        }
        else {
            return nil;
        }
    }
    
    if (cryptStatus == kCCSuccess) {
        ciphertext = [resultData base64EncodedStringWithOptions:0];
    }
    
    return ciphertext;
}

/**
 *  base64解密后des解密
 *
 *  @param cipherText   密文数据
 *  @param iv           初始向量，可为NULL，表示ECB模式；不为空则必须为8个字节，表示CBC模式
 *  @param key          密钥，可为8/16/24字节,8字节表示单DES，16字节表示双DES，24表示3DES
 *
 *  @return 成功返回明文数据，失败返回NULL
 */
+ (nullable NSString *) desDecrypt:(nonnull NSString*)cipherText initVector:(nullable NSData *)iv key:(nonnull NSData*)key
{
    NSData* cipherData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    unsigned char buffer[CryptoUtils_DES_BLOCK_SIZE_MAX];
    memset(buffer, 0, sizeof(buffer));
    size_t numBytesDecrypted = 0;
    Byte *pIv = NULL;
    
    CCAlgorithm algMode = kCCAlgorithmDES;
    NSMutableData *newKey = [NSMutableData data];
    
    //密文字节长度必须为8的倍数
    if (cipherData.length%8 != 0) {
        return nil;
    }
    
    //向量有值，则长度必须为8
    if (iv != nil && iv.length != 8) {
        return nil;
    } else {
        pIv = (Byte *)(iv.bytes);
    }
    
    //密钥长度只能为8/16/24
    switch (key.length) {
            case 8:
            algMode = kCCAlgorithmDES;
            [newKey appendData:key];
            break;
            
            case 16:
            algMode = kCCAlgorithm3DES;
            [newKey appendData:key];
            [newKey appendBytes:key.bytes length:8];
            break;
            
            case 24:
            algMode = kCCAlgorithm3DES;
            [newKey appendData:key];
            break;
            
        default:
            return nil;
            break;
    }
    
    CCCryptorStatus cryptStatus = kCCParamError;
    NSMutableData *resultData = [NSMutableData data];
    NSMutableData *tempData = [NSMutableData data];
    NSString* plainText = nil;
    
    for (int i=0; i<cipherData.length/CryptoUtils_DES_BLOCK_SIZE_MAX; i++) {
        
        tempData = [NSMutableData dataWithBytes:cipherData.bytes+i*CryptoUtils_DES_BLOCK_SIZE_MAX length:CryptoUtils_DES_BLOCK_SIZE_MAX];
        numBytesDecrypted = 0;
        
        cryptStatus = CCCrypt(kCCDecrypt,
                              algMode,
                              0x00, //no padding
                              [newKey bytes],
                              newKey.length,
                              pIv,
                              [tempData bytes],
                              [tempData length],
                              buffer,
                              CryptoUtils_DES_BLOCK_SIZE_MAX,
                              &numBytesDecrypted);
        
        if (cryptStatus == kCCSuccess) {
            NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
            [resultData appendData:data];
            
        }
        else {
            return nil;
        }

    }
    
    if (cipherData.length%CryptoUtils_DES_BLOCK_SIZE_MAX != 0) {
        
        numBytesDecrypted = 0;
        tempData = [NSMutableData dataWithBytes:cipherData.bytes+(cipherData.length - cipherData.length%CryptoUtils_DES_BLOCK_SIZE_MAX) length:cipherData.length%CryptoUtils_DES_BLOCK_SIZE_MAX];
        
        cryptStatus = CCCrypt(kCCDecrypt,
                              algMode,
                              0x00, //no padding
                              [newKey bytes],
                              newKey.length,
                              pIv,
                              [tempData bytes],
                              [tempData length],
                              buffer,
                              CryptoUtils_DES_BLOCK_SIZE_MAX,
                              &numBytesDecrypted);
        
        if (cryptStatus == kCCSuccess) {
            
            NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
            [resultData appendData:data];
            
        }
        else {
            return nil;
        }
    }
    
    if (cryptStatus == kCCSuccess) {
        
        //按照pkcs7标准去除padding
        int paddingLen = (int)(((Byte *)(resultData.mutableBytes))[resultData.length-1]);
        if (paddingLen > resultData.length) {
            paddingLen = 0;
        }
        plainText = [[NSString alloc] initWithData:[NSData dataWithBytes:resultData.bytes length:resultData.length-paddingLen] encoding:NSUTF8StringEncoding];
        
    }
    
    
    return plainText;
}


/**
 *  获取md5
 *
 *  @param data 源数据
 *
 *  @return md5值
 */
+ (NSString *_Nullable)getMD5:(NSString *_Nonnull)data
{
    NSString *md5 = nil;
    if (data != nil) {
        const char *cStr = [data UTF8String];
        unsigned char result[32];
        
        CC_MD5( cStr, (CC_LONG)(strlen(cStr)), result);
        
        md5 = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                result[0], result[1], result[2], result[3],
                result[4], result[5], result[6], result[7],
                result[8], result[9], result[10], result[11],
                result[12], result[13], result[14], result[15]
                ] uppercaseString];
        
    }
    
    return md5;
}

@end
