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

- (void)pushViewController:(Class)vc
{
    UIViewController *xx=[self viewController];
    if (xx==nil)
    {
        return;
    }
    [xx pushToViewController:[vc class]];
}

- (void)popViewController
{
    UIViewController *xx = [self viewController];
    if (xx==nil)
    {
        return;
    }
    [xx popViewController];
}

- (void)popToViewController:(Class)vc
{
    UIViewController *xx=[self viewController];
    if (xx==nil)
    {
        return;
    }
    [xx popToViewController:[vc class]];
}

- (void)popToRootViewController
{
    UIViewController *xx=[self viewController];
    if (xx==nil)
    {
        return;
    }
    [xx popToRootViewController];
}

#pragma mark - present dismiss

- (void)presentViewController:(UIViewController *)vc
{
    UIViewController *xx=[self viewController];
    if (xx==nil)
    {
        return;
    }
    
    [xx presentViewController:vc];
}

- (void)dismissViewController
{
    UIViewController *xx=[self viewController];
    if (xx==nil)
    {
        return;
    }
    
    [xx dismissViewController];
}

@end
