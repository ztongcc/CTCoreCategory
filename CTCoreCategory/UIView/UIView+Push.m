//
//  UIView+Push.m
//  TFUILib
//
//  Created by xiayiyong on 16/3/21.
//  Copyright © 2016年 上海赛可电子商务有限公司. All rights reserved.
//

#import "UIView+Push.h"
#import "UIViewController+Push.h"

@implementation UIView (Push)

- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
    
- (void)back
{
    UIViewController * vc = [self viewController];
    if (vc == nil)
    {
        return;
    }
    [vc back];
}

#pragma mark - push pop

- (void)pushToViewController:(Class)vc
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx pushToViewController:[vc class]];
    }
}

- (void)pushToXIBController:(Class)vcClass
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx pushToXIBController:vcClass];
    }
}

- (void)pushToController:(UIViewController *)vc
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx pushToController:vc];
    }
}

- (void)pushToXIBController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx pushToXIBController:vcClass param:deliverParam];
    }
}

- (void)pushToViewController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx pushToViewController:vcClass param:deliverParam];
    }
}

- (void)popViewController
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx popViewController];
    }
}

- (void)popToViewController:(Class)vc
{
    UIViewController *xx=[self viewController];
    if (xx != nil)
    {
        [xx popToViewController:[vc class]];
    }
}

- (void)popToRootViewController
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx popToRootViewController];
    }
}

#pragma mark - present dismiss

- (void)presentController:(UIViewController *)vc
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentController:vc];
    }
}

- (void)presentViewController:(Class)vcClass
{
    UIViewController * xx = [self viewController];
    if (xx != nil)
    {
        [xx presentViewController:vcClass];
    }
}

- (void)presentViewControllerInNavigation:(Class)vcClass
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentViewControllerInNavigation:vcClass];
    }
}

- (void)presentXIBController:(Class)vcClass
{
    UIViewController * xx = [self viewController];
    if (xx!=nil)
    {
        [xx presentXIBController:vcClass];
    }
}

- (void)presentXIBControllerInNavigation:(Class)vcClass
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentXIBControllerInNavigation:vcClass];
    }
}

- (void)presentViewController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentViewControllerInNavigation:vcClass param:deliverParam];
    }
}

- (void)presentViewControllerInNavigation:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentViewControllerInNavigation:vcClass param:deliverParam];
    }
}

- (void)presentXIBController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentXIBController:vcClass param:deliverParam];
    }
}

- (void)presentXIBControllerInNavigation:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx presentXIBControllerInNavigation:vcClass param:deliverParam];
    }
}

- (void)dismissViewController
{
    UIViewController *xx = [self viewController];
    if (xx != nil)
    {
        [xx dismissViewController];
    }
}

@end
