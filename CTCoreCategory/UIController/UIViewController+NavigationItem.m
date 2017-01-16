//
//  UIViewController+NavigationItem.m
//  TableView
//
//  Created by admin on 16/2/19.
//  Copyright © 2016年 Evan.Cheng. All rights reserved.
//

#import "UIViewController+NavigationItem.h"
#import <objc/runtime.h>

@implementation UIViewController (NavigationItem)

- (void)initNavigationTitleView:(UIView *(^)(void))customView
{
    UIView * titleView = customView();
    self.navigationItem.titleView = titleView;
}

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

- (void)initLeftNavigationItemWithTitle:(NSString *)title
                                 target:(id)target
                                 action:(SEL)action
                              blockItem:(void (^)(UIBarButtonItem *item))navigationItem
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    navigationItem(item);
     self.navigationItem.leftBarButtonItem = item;
}

- (void)initRightNavigationItemWithTitle:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action
                               blockItem:(void (^)(UIBarButtonItem *item))navigationItem
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    navigationItem(item);
    self.navigationItem.rightBarButtonItem = item;
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

- (void)vj_initLeftNavigationItemWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateNormal];
    [item setTitlePositionAdjustment:UIOffsetMake(8.0f, 1.0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)vj_initRightNavigationItemWithTitle:(NSString *)title
                                     target:(id)target
                                     action:(SEL)action
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateNormal];
    [item setTitlePositionAdjustment:UIOffsetMake(-8.0f, 1.0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)vj_initLeftNavigationItemWithImage:(NSString *)image
                                    target:(id)target
                                    action:(SEL)action
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:target action:action];
    [item setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)vj_initRightNavigationItemWithImage:(NSString *)image
                                     target:(id)target
                                     action:(SEL)action
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:target action:action];
    [item setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)vj_initLeftNavigationItemWithTitle:(NSString *)title
                               actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(vj_leftBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_leftBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateNormal];
    [item setTitlePositionAdjustment:UIOffsetMake(8.0f, 1.0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)vj_initRightNavigationItemWithTitle:(NSString *)title
                                actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(vj_rightBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_rightBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} forState:UIControlStateNormal];
    [item setTitlePositionAdjustment:UIOffsetMake(-8.0f, 1.0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = item;

}

- (void)vj_initLeftNavigationItemWithImage:(NSString *)image
                               actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:@selector(vj_leftBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_leftBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    [item setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.navigationItem.leftBarButtonItem = item;

}

- (void)vj_initRightNavigationItemWithImage:(NSString *)image
                                actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:@selector(vj_rightBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_rightBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    [item setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.navigationItem.rightBarButtonItem = item;
}


- (void)vj_leftBarButtonItemAction:(UIBarButtonItem *)item
{
    void (^ leftBlock)(UIBarButtonItem * item) = objc_getAssociatedObject(self, _cmd);
    if (leftBlock) {
        leftBlock(item);
    }
}


- (void)vj_rightBarButtonItemAction:(UIBarButtonItem *)item
{
    void (^ rightBlock)(UIBarButtonItem * item) = objc_getAssociatedObject(self, _cmd);
    if (rightBlock) {
        rightBlock(item);
    }
}
@end
