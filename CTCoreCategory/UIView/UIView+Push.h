//
//  UIView+Push.h
//  TFUILib
//
//  Created by xiayiyong on 16/3/21.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Push)


- (UIViewController *)viewController;
    
/**
 *  返回方法
 */
- (void)back;

#pragma mark - push pop

/**
 *  push方法
 *
 *  @param vc 控制器
 */
- (void)pushViewController:(Class )vc;

/**
 *  pop view所在的VC方法
 */
- (void)popViewController;

/**
 *  pop方法
 *
 *  @param vc 控制器
 */
-(void)popToViewController:(Class )vc;


/**
 *  pop到root
 */
-(void) popToRootViewController;

#pragma mark - present dismiss

/**
 *  模态视图
 */
- (void)presentController:(UIViewController *)vc;

- (void)presentViewController:(Class)vc;

- (void)presentViewControllerInNavagation:(Class)vcClass;

- (void)presentXIBViewController:(Class)vcClass;

- (void)presentXIBViewControllerInNavagation:(Class)vcClass;

/**
 *  dismiss view所在的VC方法
 */
- (void)dismissViewController;

@end
