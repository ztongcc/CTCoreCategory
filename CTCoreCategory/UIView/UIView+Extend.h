//
//  UIView+Extend.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


#define CustomViewTranslate(ViewClass,view) (ViewClass *)view;

typedef enum{
    
    //上
    UIViewBorderDirectTop=0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
    
}UIViewBorderDirect;

@interface UIView (Extend)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat radius;


/**
 *  自动从xib创建视图
 */
+ (instancetype)viewFromXIB;

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)ct_addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width;

/**
 *  添加一组子view：
 */
- (void)ct_addSubviewsWithArray:(NSArray *)subViews;

/**
 *  添加边框:四边
 */
- (void)ct_setBorder:(UIColor *)color width:(CGFloat)width;

/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+ (void)ct_removeViews:(NSArray *)views;

- (CGFloat)ct_alphaInPoint:(CGPoint)point;

- (UIColor *)ct_colorInPoint:(CGPoint)point;


@end
