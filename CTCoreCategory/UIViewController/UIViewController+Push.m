//
//  UIViewController+Push.m
//  VJUIDemo
//
//  Created by Admin on 16/6/30.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "UIViewController+Push.h"

@implementation UIViewController (Push)

- (UIViewController *)rootViewController
{
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    return rootVC;
}

- (void)back
{
    if (self.presentingViewController != nil)
    {
        if (self.navigationController == nil)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        
        NSArray *arr = self.navigationController.viewControllers;
        if ([arr count] > 0)
        {
            if (self==self.navigationController.viewControllers[0])
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else
            {
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    else
    {
        if (self.navigationController == nil)
        {
            return;
        }
        
        UIViewController *rootVC = [self rootViewController];
        if ([rootVC isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *rootNav= (UINavigationController *)rootVC;
            [rootNav popViewControllerAnimated:YES];
        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
    

- (void)pushController:(UIViewController *)vc
{
    if ([self isKindOfClass:[UINavigationController class]])
    {
        [(UINavigationController *)self pushViewController:vc animated:YES];
    }
    else
    {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)popController:(UIViewController *)vc
{
    UINavigationController * navVC;
    if ([self isKindOfClass:[UINavigationController class]])
    {
        navVC = (UINavigationController *)self;
    }
    else
    {
        navVC = self.navigationController;
    }
    
    if (vc == nil)
    {
        [navVC popViewControllerAnimated:YES];
    }
    else
    {
        [navVC popToViewController:vc animated:YES];
    }
}

- (void)pushToXIBController:(Class)vcClass
{
    UIViewController * vc = [[vcClass  alloc] initWithNibName:NSStringFromClass([vcClass class]) bundle:nil];
    [self pushController:vc];
}

- (void)pushToViewController:(Class)vcClass
{
    UIViewController * vc = [[vcClass  alloc] init];
    [self pushController:vc];
}

- (void)pushToXIBController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController * vc = [[vcClass  alloc] initWithNibName:NSStringFromClass([vcClass class]) bundle:nil];
    if (deliverParam) {
        deliverParam(vc);
    }
    [self pushController:vc];
}

- (void)pushToViewController:(Class)vcClass param:(void (^)(id toVC))deliverParam
{
    UIViewController * vc = [[vcClass  alloc] init];
    if (deliverParam) {
        deliverParam(vc);
    }
    [self pushController:vc];
}

- (void)popViewControllerAnimated
{
    [self popController:nil];
}

- (void)popToViewControllerAnimated:(Class)vcClass
{
    NSArray * controllerAry = self.navigationController.viewControllers;
    if (controllerAry.count == 1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        __block BOOL pop;
        [controllerAry enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
            if ([obj isMemberOfClass:[vcClass class]])
            {
                [self popController:obj];
                pop = YES;
                *stop = YES;
            }
        }];
        if (!pop)
        {
            [self popController:nil];
        }
    }
}

@end
