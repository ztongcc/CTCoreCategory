//
//  UIViewController+Push.h
//  VJUIDemo
//
//  Created by Admin on 16/6/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Push)

/**
 *  获取APP 根ViewController
 *
 *  @return
 */
- (UIViewController *)rootViewController;

/**
 *  返回方法
 */
- (void)back;

/**
 *  push方法
 *
 *  @param vc 控制器
 */
- (void)pushToXIBController:(Class)vcClass;

- (void)pushToViewController:(Class)vcClass;

- (void)pushToXIBController:(Class)vcClass param:(void (^)(id toVC))deliverParam;

- (void)pushToViewController:(Class)vcClass param:(void (^)(id toVC))deliverParam;

- (void)popViewController;
    
- (void)popToRootController;

- (void)popToViewController:(Class)vcClass;

@end
