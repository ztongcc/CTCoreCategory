//
//  UIViewController+NavigationItem.m
//  TableView
//
//  Created by admin on 16/2/19.
//  Copyright © 2016年 Evan.Cheng. All rights reserved.
//

#import "UIViewController+NavigationItem.h"

@implementation UIViewController (NavigationItem)

- (void)initLeftNavigationItemWithTitle:(NSString *)title
                                 target:(id)target
                                 action:(SEL)action
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

- (void)initLeftNavigationItemWithImage:(NSString *)image
                                 target:(id)target
                                 action:(SEL)action
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStylePlain target:target action:action];
}

- (void)initRightNavigationItemWithTitle:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

- (void)initRightNavigationItemWithImage:(NSString *)image
                                  target:(id)target
                                  action:(SEL)action
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStylePlain target:target action:action];
}

- (void)initLeftNavigationItemWithCustomButton:(void(^)(UIButton * btn))customButton
{
    UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton(itemBtn);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
}

- (void)initRightNavigationItemWithCustomButton:(void(^)(UIButton * btn))customButton
{
    UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton(itemBtn);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
}

- (void)initLeftNavigationItemWithCustomView:(void(^)(UIView * superView))customView
{
    UIView * itemView = [UIView new];
    customView(itemView);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemView];

}

- (void)initRightNavigationItemWithCustomView:(void(^)(UIView * superView))customView
{
    UIView * itemView = [UIView new];
    customView(itemView);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemView];
}
@end
