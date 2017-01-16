//
//  NSMutableAttributedString+Attributes.m
//  VJUIDemo
//
//  Created by Admin on 16/6/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//
#import "NSMutableAttributedString+Attributes.h"
@interface NSString(MASAttributes)
-(NSRange)rangeOfStringNoCase:(NSString*)s;
@end

@implementation NSString(MASAttributes)
-(NSRange)rangeOfStringNoCase:(NSString*)s
{
    if (s == nil) {
        return NSMakeRange(0, self.length);
    }
    return  [self rangeOfString:s options:NSCaseInsensitiveSearch];
}
@end
@implementation NSMutableAttributedString (Attributes)
- (void)addColor:(UIColor *)color substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSForegroundColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addBackgroundColor:(UIColor *)color substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSBackgroundColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addUnderlineForSubstring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute: NSUnderlineStyleAttributeName
                     value:@(NSUnderlineStyleSingle)
                     range:range];
    }
}
- (void)addObliqueness:(CGFloat)obliqueness substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute: NSObliquenessAttributeName
                     value:@(obliqueness)
                     range:range];
    }
}
- (void)addStrikeThrough:(int)thickness substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute: NSStrikethroughStyleAttributeName
                     value:@(thickness)
                     range:range];
    }
}
- (void)addShadowColor:(UIColor *)color width:(int)width height:(int)height radius:(int)radius substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:color];
        [shadow setShadowOffset:CGSizeMake (width, height)];
        [shadow setShadowBlurRadius:radius];
        
        [self addAttribute: NSShadowAttributeName
                     value:shadow
                     range:range];
    }
}
- (void)addFontWithName:(NSString *)fontName size:(int)fontSize substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && fontName != nil) {
        UIFont * font = [UIFont fontWithName:fontName size:fontSize];
        [self addAttribute: NSFontAttributeName
                     value:font
                     range:range];
    }
}
- (void)addFont:(UIFont *)font substring:(NSString *)substring {
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && font != nil) {
        [self addAttribute: NSFontAttributeName
                     value:font
                     range:range];
    }
}
- (void)addAlignment:(NSTextAlignment)alignment substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        NSMutableParagraphStyle* style=[[NSMutableParagraphStyle alloc]init];
        style.alignment = alignment;
        [self addAttribute: NSParagraphStyleAttributeName
                     value:style
                     range:range];
    }
}
- (void)addStrokeColor:(UIColor *)color thickness:(int)thickness substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSStrokeColorAttributeName
                     value:color
                     range:range];
        [self addAttribute:NSStrokeWidthAttributeName
                     value:@(thickness)
                     range:range];
    }
}
- (void)addVerticalGlyph:(BOOL)glyph substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute:NSForegroundColorAttributeName
                     value:@(glyph)
                     range:range];
    }
}

- (void)addParagraphStyle:(NSParagraphStyle *)style substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute:NSParagraphStyleAttributeName
                     value:style
                     range:range];
    }
}
- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && attrs != nil) {
        [self addAttributes:attrs range:range];
    }
}

@end


@implementation NSAttributedString (Constructors)
+(id)attributedStringWithString:(NSString*)string
{
    return string ? [[self alloc] initWithString:string] : nil;
}

+(id)attributedStringWithHTMLString:(NSString *)string
{
    if (!string)
    {
        return nil;
    }
    NSString * fontName = [UIFont systemFontOfSize:12].fontName;
    NSString * resStr = [string stringByAppendingFormat:@"<style>body{font-family:'%@'}</style>",fontName];
    NSData * data = [resStr dataUsingEncoding:NSUnicodeStringEncoding];
    if (!data)
    {
        return nil;
    }
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
    return [[self alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

+(id)attributedStringWithHTMLString:(NSString *)string fontSize:(CGFloat)size
{
    if (!string)
    {
        return nil;
    }
    NSString * fontName = [UIFont systemFontOfSize:12].fontName;
    NSString * resStr = [string stringByAppendingFormat:@"<style>body{font-family:'%@';font-size:%fpx;}</style>", fontName, size];
    NSData * data = [resStr dataUsingEncoding:NSUnicodeStringEncoding];
    if (!data)
    {
        return nil;
    }
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType};
    return [[self alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

+(id)attributedStringWithAttributedString:(NSAttributedString*)attrStr
{
    return attrStr ? [[self alloc] initWithAttributedString:attrStr] : nil;
}

-(CGSize)sizeConstrainedToSize:(CGSize)maxSize
{
    return [self sizeConstrainedToSize:maxSize fitRange:NULL];
}
-(CGSize)sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange*)fitRange
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    CFRange fitCFRange = CFRangeMake(0,0);
    CGSize sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,0),NULL,maxSize,&fitCFRange);
    if (framesetter) CFRelease(framesetter);
    if (fitRange) *fitRange = NSMakeRange(fitCFRange.location, fitCFRange.length);
    return CGSizeMake( floorf(sz.width+1) , floorf(sz.height+1) ); // take 1pt of margin for security
}
@end

