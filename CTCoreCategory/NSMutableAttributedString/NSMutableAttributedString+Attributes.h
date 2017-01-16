//
//  NSMutableAttributedString+Attributes.h
//  VJWealth
//
//  Created by Admin on 16/8/29.
//  Copyright © 2016年 vjwealth. All rights reserved.
//

#ifdef __MAC_OS_X_VERSION_MIN_REQUIRED
typedef NSFont UIFont;
typedef NSColor UIColor;
#endif


#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Attributes)

- (void)addColor:(UIColor *)color substring:(NSString *)substring;
- (void)addBackgroundColor:(UIColor *)color substring:(NSString *)substring;
- (void)addUnderlineForSubstring:(NSString *)substring;
- (void)addObliqueness:(CGFloat)obliqueness substring:(NSString *)substring;
- (void)addStrikeThrough:(int)thickness substring:(NSString *)substring;
- (void)addShadowColor:(UIColor *)color width:(int)width height:(int)height radius:(int)radius substring:(NSString *)substring;
- (void)addFontWithName:(NSString *)fontName size:(int)fontSize substring:(NSString *)substring;
- (void)addFont:(UIFont *)font substring:(NSString *)substring;
- (void)addAlignment:(NSTextAlignment)alignment substring:(NSString *)substring;
- (void)addStrokeColor:(UIColor *)color thickness:(int)thickness substring:(NSString *)substring;
- (void)addVerticalGlyph:(BOOL)glyph substring:(NSString *)substring;
- (void)addParagraphStyle:(NSParagraphStyle *)style substring:(NSString *)substring;
- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs substring:(NSString *)substring;

@end


@interface NSAttributedString (Constructors)

+(id)attributedStringWithString:(NSString*)string;

+(id)attributedStringWithHTMLString:(NSString *)string;

+(id)attributedStringWithHTMLString:(NSString *)string fontSize:(CGFloat)size;

+(id)attributedStringWithAttributedString:(NSAttributedString*)attrStr;

//! Commodity method that call the following sizeConstrainedToSize:fitRange: method with NULL for the fitRange parameter
-(CGSize)sizeConstrainedToSize:(CGSize)maxSize;
//! if fitRange is not NULL, on return it will contain the used range that actually fits the constrained size.
//! Note: Use CGFLOAT_MAX for the CGSize's height if you don't want a constraint for the height.
-(CGSize)sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange*)fitRange;
@end

