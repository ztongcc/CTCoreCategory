//
//  UIViewController+NavigationItem.h
//  TableView
//
//  Created by admin on 16/2/19.
//  Copyright © 2016年 Evan.Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>


// 可通过以下方法整体调整导航条文字和图片的位置
//   [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
 //  [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(8.0f, 0.0) forBarMetrics:UIBarMetricsDefault];


@interface UIViewController (NavigationItem)



- (void)initBarTitleView:(UIView *(^)(void))customView;

/**
 *  初始化导航栏左侧按钮文字
 *
 *  @param title 文字
 */
- (void)initLeftBarItemWithTitle:(NSString *)title
                          action:(SEL)action;

/**
 *  初始化导航栏左侧按钮图片
 *
 *  @param image  图片名
 */
- (void)initLeftBarItemWithImage:(NSString *)image
                          action:(SEL)action;

/**
 *  初始化导航栏右侧侧按钮文字
 *
 *  @param title 文字
 */
- (void)initRightBarItemWithTitle:(NSString *)title
                           action:(SEL)action;

/**
 *  初始化导航栏右侧按钮图片
 *
 *  @param image  图片名
 */
- (void)initRightBarItemWithImage:(NSString *)image
                           action:(SEL)action;

/**
 *  初始化导航栏左侧按钮 可自定义 item 样式
 *
 *  @param title      文字
 *  @param action     action
 *  @param itemBlock  自定义Block
 */
- (void)initLeftBarItemWithTitle:(NSString *)title
                          action:(SEL)action
                       blockItem:(void (^)(UIBarButtonItem *item))itemBlock;
/**
 *  初始化导航栏右侧按钮 可自定义 item 样式
 *
 *  @param title      文字
 *  @param action     action
 *  @param itemBlock  自定义Block
 */
- (void)initRightBarItemWithTitle:(NSString *)title
                           action:(SEL)action
                        blockItem:(void (^)(UIBarButtonItem *item))itemBlock;

    
    
/**
 *  通过自定义Button 初始化导航栏左侧按钮
 *
 *  @param customButton  自定义Button block
 */
- (void)initLeftBarItemWithCustomButton:(void(^)(UIButton * btn))customButton;
    
/**
 *  通过自定义Button 初始化导航栏右侧按钮
 *
 *  @param customButton  自定义Button block
 */
- (void)initRightBarItemWithCustomButton:(void(^)(UIButton * btn))customButton;

    

/**
 *  通过自定义View 初始化导航栏左侧按钮
 *
 *  @param View  自定义View block
 */

- (void)initLeftBarItemWithCustomView:(void(^)(UIView * superView))customView;
    
/**
 *  通过自定义View 初始化导航栏右侧按钮
 *
 *  @param customView  自定义View block
 */
- (void)initRightBarItemWithCustomView:(void(^)(UIView * superView))customView;

    
    
/**
 *  初始化导航栏左侧按钮, 通过 title 和 tapBlock
 *
 *  @param title  文字
 *  @param tapAction  点击事件 block
 */
- (void)initLeftBarItemWithTitle:(NSString *)title
                     actionBlock:(void (^)(UIBarButtonItem *item))tapAction;

/**
 *  初始化导航栏右侧按钮, 通过 title 和 tapBlock
 *
 *  @param title  文字
 *  @param tapAction  点击事件 block
 */
- (void)initRightBarItemWithTitle:(NSString *)title
                      actionBlock:(void (^)(UIBarButtonItem *item))tapAction;
/**
 *  初始化导航栏左侧按钮, 通过 image 和 tapBlock
 *
 *  @param image  图片名
 *  @param tapAction  点击事件 block
 */
- (void)initLeftBarItemWithImage:(NSString *)image
                     actionBlock:(void (^)(UIBarButtonItem *item))tapAction;
/**
 *  初始化导航栏右侧按钮, 通过 image 和 tapBlock
 *
 *  @param image  图片名
 *  @param tapAction  点击事件 block
 */
- (void)initRightBarItemWithImage:(NSString *)image
                      actionBlock:(void (^)(UIBarButtonItem *item))tapAction;

    
    
    
/**
 *  通过自定义UIBarButtonItem  初始化导航栏左侧按钮
 *
 *  @param itemBlock  自定义 UIBarButtonItem block
 *  @param tapAction  点击事件 block
 */
- (void)initLeftBarItemWithBlock:(void (^)(UIBarButtonItem *item))itemBlock
                     actionBlock:(void (^)(UIBarButtonItem *item))tapAction;
    
/**
 *  通过自定义UIBarButtonItem  初始化导航栏右侧按钮
 *
 *  @param itemBlock  自定义 UIBarButtonItem block
 *  @param tapAction  点击事件 block
 */
- (void)initRightBarItemWithBlock:(void (^)(UIBarButtonItem *item))itemBlock
                      actionBlock:(void (^)(UIBarButtonItem *item))tapAction;

@end
