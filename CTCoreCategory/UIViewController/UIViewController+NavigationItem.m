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

- (void)initBarTitleView:(UIView *(^)(void))customView
{
    UIView * titleView = customView();
    self.navigationItem.titleView = titleView;
}

- (void)initLeftBarItemWithTitle:(NSString *)title
                          action:(SEL)action
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)initRightBarItemWithTitle:(NSString *)title
                           action:(SEL)action
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)initLeftBarItemWithImage:(NSString *)image
                          action:(SEL)action
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);

    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)initRightBarItemWithImage:(NSString *)image
                           action:(SEL)action
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);

    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItem = item;
}
    
- (void)initLeftBarItemWithTitle:(NSString *)title
                          action:(SEL)action
                       blockItem:(void (^)(UIBarButtonItem *item))itemBlock
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);

    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (itemBlock) {
        itemBlock(item);
    }
    self.navigationItem.leftBarButtonItem = item;
}

- (void)initRightBarItemWithTitle:(NSString *)title
                           action:(SEL)action
                        blockItem:(void (^)(UIBarButtonItem *item))itemBlock
{
    NSString * des = [NSString stringWithFormat:@"请实现 [- %@ -] 类中 %s 方法 所对应的 action", [self class], _cmd];
    NSAssert([self respondsToSelector:action], des);

    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (itemBlock) {
        itemBlock(item);
    }
    self.navigationItem.rightBarButtonItem = item;
}

- (void)initLeftBarItemWithCustomButton:(void(^)(UIButton * btn))customButton
{
    UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (customButton) {
        customButton(itemBtn);
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
}

- (void)initRightBarItemWithCustomButton:(void(^)(UIButton * btn))customButton
{
    UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (customButton) {
        customButton(itemBtn);
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
}

- (void)initLeftBarItemWithCustomView:(void(^)(UIView * superView))customView
{
    UIView * itemView = [UIView new];
    if (customView) {
        customView(itemView);
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemView];
}

- (void)initRightBarItemWithCustomView:(void(^)(UIView * superView))customView
{
    UIView * itemView = [UIView new];
    if (customView) {
        customView(itemView);
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemView];
}

- (void)initLeftBarItemWithTitle:(NSString *)title
                     actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(vj_leftBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_leftBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.leftBarButtonItem = item;
}

- (void)initRightBarItemWithTitle:(NSString *)title
                      actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(vj_rightBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(vj_rightBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.rightBarButtonItem = item;

}

- (void)initLeftBarItemWithImage:(NSString *)image
                     actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(leftBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.leftBarButtonItem = item;

}

- (void)initRightBarItemWithImage:(NSString *)image
                      actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIImage * itemImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:itemImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction:)];
    objc_setAssociatedObject(self, @selector(rightBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.rightBarButtonItem = item;
}

    
- (void)initLeftBarItemWithBlock:(void (^)(UIBarButtonItem *item))itemBlock
                     actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] init];
    if (itemBlock) {
        itemBlock(item);
    }
    objc_setAssociatedObject(self, @selector(leftBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.leftBarButtonItem = item;

}

- (void)initRightBarItemWithBlock:(void (^)(UIBarButtonItem *item))itemBlock
                      actionBlock:(void (^)(UIBarButtonItem *))tapAction
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] init];
    if (itemBlock) {
        itemBlock(item);
    }
    objc_setAssociatedObject(self, @selector(rightBarButtonItemAction:), tapAction, OBJC_ASSOCIATION_COPY);
    self.navigationItem.rightBarButtonItem = item;

}

- (void)leftBarButtonItemAction:(UIBarButtonItem *)item
{
    void (^ leftBlock)(UIBarButtonItem * item) = objc_getAssociatedObject(self, _cmd);
    if (leftBlock) {
        leftBlock(item);
    }
}


- (void)rightBarButtonItemAction:(UIBarButtonItem *)item
{
    void (^ rightBlock)(UIBarButtonItem * item) = objc_getAssociatedObject(self, _cmd);
    if (rightBlock) {
        rightBlock(item);
    }
}
@end
