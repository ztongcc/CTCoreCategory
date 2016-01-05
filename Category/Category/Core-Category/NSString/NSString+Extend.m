//
//  NSString+Extend.m
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "NSString+Extend.h"
#import <UIKit/UIKit.h>

@implementation NSString (Extend)

// 统计中英文字符混合长度
- (NSUInteger)unicodeLength
{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++)
    {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    return asciiLength;
}

- (NSUInteger)unicodeLengthOfCH
{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++)
    {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 0 : 1;
    }
    return asciiLength;
}

- (NSUInteger)unicodeLengthOfEN
{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++)
    {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 1 : 0;
    }
    return asciiLength;
}


/** 删除所有的空格 */
-(NSString *)deleteSpace
{
    
    NSMutableString *strM = [NSMutableString stringWithString:self];
    
    [strM replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:NSMakeRange(0, strM.length)];
    
    return [strM copy];
}

/*
 *  时间戳对应的NSDate
 */
-(NSDate *)date
{
    NSTimeInterval timeInterval=self.floatValue;
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

/**
 *  时间戳转格式化的时间字符串
 */
-(NSString *)timestampToTimeStringWithFormatString:(NSString *)formatString{
    //时间戳转date
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[self integerValue]];
    
    return [self timeStringFromDate:date formatString:formatString];
}

-(NSString *)timeStringFromDate:(NSDate *)date formatString:(NSString *)formatString{
    //实例化时间格式化工具
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    
    //定义格式
    formatter.dateFormat=formatString;
    
    //时间转化为字符串
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}


- (BOOL)isContainsString:(NSString *)string
{
    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 8.0)
    {
        return [self containsString:string];
    }
    else
    {
        if ([self rangeOfString:string options:NSCaseInsensitiveSearch].location == NSNotFound)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
}

- (NSString *)timestampConvertToSuffix
{
    NSDate * sourDate = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000];
    NSDate * nowDate = [NSDate date];
    
    NSString *strResult = nil;
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit|NSSecondCalendarUnit | NSDayCalendarUnit| NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *DateComponent = [chineseClendar components:unitFlags fromDate:sourDate toDate:nowDate options:0];
    
    NSInteger diffHour = [DateComponent hour];
    NSInteger diffMin = [DateComponent minute];
    NSInteger diffSec = [DateComponent second];
    NSInteger diffDay = [DateComponent day];
    NSInteger diffMon = [DateComponent month];
    NSInteger diffYear = [DateComponent year];
    if (diffYear>0)
    {
        strResult=[NSString stringWithFormat:@"%ld 年前",(long)diffYear];
    }else if(diffMon>0)
    {
        strResult=[NSString stringWithFormat:@"%ld 月前",(long)diffMon];
    }else if(diffDay>0)
    {
        strResult = [NSString stringWithFormat:@"%ld 天前",(long)diffDay];
    }else if(diffHour>0)
    {
        strResult = [NSString stringWithFormat:@"%ld 小时前",(long)diffHour];
    }else if(diffMin>0)
    {
        strResult = [NSString stringWithFormat:@"%ld 分钟前",(long)diffMin];
    }else if(diffSec>0)
    {
        strResult = [NSString stringWithFormat:@"%ld 秒前",(long)diffSec];
    }else
    {
        strResult = [NSString stringWithFormat:@"刚刚"];
    }
    return strResult;
}
- (CGSize)size_With_Font:(UIFont *)font
{
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    return [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, nil]];
#else
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version < 7.0)
    {
        return [self sizeWithFont:font];
    }
    else
    {
        return [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]];
    }
#endif
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize textSize = CGSizeZero;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    textSize = [self boundingRectWithSize: size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:[NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, nil]
                                  context: nil].size;
#else
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version < 7.0)
    {
        textSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
    }
    else
    {
        textSize = [self boundingRectWithSize:size
                                      options: NSStringDrawingUsesLineFragmentOrigin
                                   attributes:[NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, nil]
                                      context: nil].size;
    }
#endif
    return textSize.height;
}


- (CGFloat)widthWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize textSize = CGSizeZero;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    textSize = [self boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                  context:nil].size;
#else
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version < 7.0)
    {
        textSize = [self sizeWithFont: font constrainedToSize:size];
    }
    else
    {
        textSize = [self boundingRectWithSize: size
                                      options: NSStringDrawingUsesLineFragmentOrigin
                                   attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                      context: nil].size;
        
    }
#endif
    return textSize.width;
}
- (CGFloat)hieghtWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize textSize = CGSizeZero;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    textSize = [self boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                  context:nil].size;
#else
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version < 7.0)
    {
        textSize = [self sizeWithFont: font constrainedToSize:size];
    }
    else
    {
        textSize = [self boundingRectWithSize: size
                                      options: NSStringDrawingUsesLineFragmentOrigin
                                   attributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]
                                      context: nil].size;
        
    }
#endif
    return textSize.height;
}


@end
