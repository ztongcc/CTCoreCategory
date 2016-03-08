//
//  UIViewController+Extend.m
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "UIViewController+Extend.h"
#import "NSObject+property.h"

@implementation UIViewController (Extend)

UIViewController * InstantiateViewControllerFromXIB(Class VCClassName)
{
    return [[[VCClassName class] alloc] initWithNibName:NSStringFromClass([VCClassName class]) bundle:nil];
}

- (UIViewController *)pushToViewController:(Class)VCClassName
{
    UIViewController * vc = [[[VCClassName class] alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    return vc;
}

- (UIViewController *)pushToXIBViewController:(Class)VCClassName;
{
    UIViewController * vc = [[[VCClassName class] alloc] initWithNibName:NSStringFromClass(VCClassName) bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    return vc;
}

- (UIViewController *)pushToViewController:(Class)VCClassName toParamDict:(NSDictionary *)paramDict
{
    UIViewController * vc = [[[VCClassName class] alloc] init];
    NSArray * keyAry = [paramDict allKeys];
    NSArray * propertyList = [VCClassName PropertyListArray];
    for (NSString * key in keyAry) {
        if ([propertyList containsObject:key]) {
            [vc setValue:paramDict[key] forKey:key];
        }
    }
    [self.navigationController pushViewController:vc animated:YES];
    return vc;
}

- (UIViewController *)pushToXIBViewController:(Class)VCClassName toParamDict:(NSDictionary *)paramDict
{
    UIViewController * vc = [[[VCClassName class] alloc] initWithNibName:NSStringFromClass(VCClassName) bundle:nil];
    NSArray * keyAry = [paramDict allKeys];
    NSArray * propertyList = [VCClassName PropertyListArray];
    for (NSString * key in keyAry) {
        if ([propertyList containsObject:key]) {
            [vc setValue:paramDict[key] forKey:key];
        }
    }
    [self.navigationController pushViewController:vc animated:YES];
    return vc;
}

- (UIViewController *)presentViewController:(Class)VCClassName
{
    UIViewController * vc = [[[VCClassName class] alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    return vc;
}

- (UIViewController *)presentXIBViewController:(Class)VCClassName
{
    UIViewController * vc = [[[VCClassName class] alloc] initWithNibName:NSStringFromClass(VCClassName) bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
    return vc;
}

- (void)popViewController
{
    if (self.navigationController && self.navigationController.viewControllers.count != 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)popToViewController:(Class)VCClassName
{
    if (self.navigationController && self.navigationController.viewControllers.count != 0) {
        NSArray * controllerAry = self.navigationController.viewControllers;
        if (controllerAry.count != 1) {
            [controllerAry enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isMemberOfClass:[VCClassName class]]) {
                    [self.navigationController popToViewController:obj animated:YES];
                }
            }];
        }
    }
}

@end
