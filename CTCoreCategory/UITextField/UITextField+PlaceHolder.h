//
//  UITextField+PlaceHolder.h
//  Pods
//
//  Created by Admin on 2017/2/23.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (Placeholder)

/**
 *  限制输入框可输入的字符串长度
 *
 *  @param length
 */

@property (nonatomic, assign) NSInteger maxInputLength;

/**
 *  占位符颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 *  占位符字体
 */
@property (nonatomic, strong) UIFont *placeholderFont;


@end
