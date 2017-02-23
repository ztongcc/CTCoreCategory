//
//  UITextField+PlaceHolder.m
//  Pods
//
//  Created by Admin on 2017/2/23.
//
//

#import "UITextField+Placeholder.h"
#import <objc/runtime.h>



@implementation UITextField (Placeholder)

- (void)setMaxInputLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, @selector(maxInputLength), [NSNumber numberWithInt:maxLength], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextInputLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (NSInteger)maxInputLength
{
    NSInteger length = [objc_getAssociatedObject(self, _cmd) intValue];
    return length;
}

- (void)textFieldTextInputLengthLimit:(id)sender
{
    int length = self.maxInputLength;
    if(self.text.length > length)
    {
        self.text = [self.text substringToIndex:length];
    }
}

- (UIColor *)placeholderColor
{
    return [self valueForKey:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (self.text == nil) {
        self.text = @"";
    }
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (UIFont *)placeholderFont
{
    return [self valueForKey:@"_placeholderLabel.font"];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    if (self.text == nil) {
        self.text = @"";
    }
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

@end
