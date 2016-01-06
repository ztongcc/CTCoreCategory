//
//  UIViewController+Extend.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extend)

UIViewController * InstantiateViewControllerFromXIB(Class VCClassName);

- (UIViewController *)pushToViewController:(Class)VCClassName;

- (UIViewController *)pushToXIBViewController:(Class)VCClassName;

- (UIViewController *)pushToViewController:(Class)VCClassName toParamDict:(NSDictionary *)paramDict;

- (UIViewController *)pushToXIBViewController:(Class)VCClassName toParamDict:(NSDictionary *)paramDict;

- (UIViewController *)presentViewController:(Class)VCClassName;

- (UIViewController *)presentXIBViewController:(Class)VCClassName;

@end
