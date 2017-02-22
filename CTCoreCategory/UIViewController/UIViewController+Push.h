//
//  UIViewController+Push.h
//  VJUIDemo
//
//  Created by Admin on 16/6/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Push)

- (void)pushToXIBController:(Class)vcClass;

- (void)pushToViewController:(Class)vcClass;

- (void)pushToXIBController:(Class)vcClass param:(void (^)(UIViewController * toVC))deliverParam;

- (void)pushToViewController:(Class)vcClass param:(void (^)(UIViewController * toVC))deliverParam;

- (void)popViewControllerAnimated;

- (void)popToViewControllerAnimated:(Class)vcClass;

@end
