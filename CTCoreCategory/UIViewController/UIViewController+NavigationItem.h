//
//  UIViewController+NavigationItem.h
//  TableView
//
//  Created by admin on 16/2/19.
//  Copyright © 2016年 Evan.Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationItem)

- (void)initNavigationTitleView:(UIView *(^)(void))customView;

- (void)initLeftNavigationItemWithTitle:(NSString *)title
                                 target:(id)target
                                 action:(SEL)action;


- (void)initLeftNavigationItemWithImage:(NSString *)image
                                 target:(id)target
                                 action:(SEL)action;

- (void)initRightNavigationItemWithTitle:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action;


- (void)initRightNavigationItemWithImage:(NSString *)image
                                  target:(id)target
                                  action:(SEL)action;

- (void)initLeftNavigationItemWithTitle:(NSString *)title
                                 target:(id)target
                                 action:(SEL)action
                              blockItem:(void (^)(UIBarButtonItem *item))navigationItem;

- (void)initRightNavigationItemWithTitle:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action
                               blockItem:(void (^)(UIBarButtonItem *item))navigationItem;


- (void)initLeftNavigationItemWithCustomButton:(void(^)(UIButton * btn))customButton;
- (void)initRightNavigationItemWithCustomButton:(void(^)(UIButton * btn))customButton;

- (void)initLeftNavigationItemWithCustomView:(void(^)(UIView * superView))customView;
- (void)initRightNavigationItemWithCustomView:(void(^)(UIView * superView))customView;


// 以下方法供工资钱包App使用
- (void)vj_initLeftNavigationItemWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;

- (void)vj_initRightNavigationItemWithTitle:(NSString *)title
                                     target:(id)target
                                     action:(SEL)action;

- (void)vj_initLeftNavigationItemWithImage:(NSString *)image
                                    target:(id)target
                                    action:(SEL)action;

- (void)vj_initRightNavigationItemWithImage:(NSString *)image
                                     target:(id)target
                                     action:(SEL)action;

- (void)vj_initLeftNavigationItemWithTitle:(NSString *)title
                               actionBlock:(void (^)(UIBarButtonItem *))tapAction;

- (void)vj_initRightNavigationItemWithTitle:(NSString *)title
                                actionBlock:(void (^)(UIBarButtonItem *))tapAction;

- (void)vj_initLeftNavigationItemWithImage:(NSString *)image
                               actionBlock:(void (^)(UIBarButtonItem *))tapAction;

- (void)vj_initRightNavigationItemWithImage:(NSString *)image
                                actionBlock:(void (^)(UIBarButtonItem *))tapAction;



@end
