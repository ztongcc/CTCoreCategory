//
//  NSString+Extend.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extend)

/**
 *  统计中英文字符长度
 *
 *  @return
 */
@property (nonatomic, assign, readonly)NSUInteger unicodeLength;
/**
 *  统计中文字符长度
 *
 *  @return
 */
@property (nonatomic, assign, readonly)NSUInteger unicodeLengthOfCH;
/**
 *  统计英文字符长度
 *
 *  @return
 */
@property (nonatomic, assign, readonly)NSUInteger unicodeLengthOfEN;

/** 删除所有的空格 */
@property (nonatomic, copy,   readonly)NSString   * deleteSpace;

/*
 *  时间戳对应的NSDate
 */
@property (nonatomic, strong, readonly) NSDate *date;

/*
 *  是否包含某一字符串
 */
- (BOOL)isContainsString:(NSString *)string;

/**
 *  时间戳转格式化的时间字符串
 */
- (NSString *)timestampToTimeStringWithFormatString:(NSString *)formatString;

/**
 *        
 */
- (NSString *)timestampConvertToSuffix;
// 求高度
- (CGSize)size_With_Font:(UIFont *)font;

- (CGFloat)hieghtWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

// 求宽度
- (CGFloat)widthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
