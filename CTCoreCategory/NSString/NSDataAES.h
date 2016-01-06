//
//  NSDataAES.h
//
//  Created by cheng on 15/12/25.
//  Copyright © 2015年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * kCryptorKey;

#pragma mark - @interface NSData (AES128)

@interface NSData (AES128)

+ (NSData *)dataFromBase64String:(NSString *)aString;
- (NSString *)base64EncodedString;

@end

#pragma mark - @interface NSString (Encrypt)

@interface NSString (Encrypt)

- (NSString *)AES128EncryptWithKey:(NSString *)key; 
- (NSString *)AES128DecryptWithKey:(NSString *)key;
- (NSString *)stringByURLEncodingStringParameter;

- (NSString *)MD5String;

// base64 加密
- (NSString *)base64Encrypt;
// base64 解密
- (NSString *)base64Decrypt;

- (NSString *)sha1;


@end