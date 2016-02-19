//
//  UITableViewCell+Extend.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extend)

/**
 *  创建cell
 *
 *  @param tableView   所属tableView
 *  @param indentifier indentifier
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellWithTableViewFromXIB:(UITableView *)tableView indentifier:(NSString *)indentifier;

/**
 *  创建 cell
 *
 *  @param tableView   所属tableView
 *  @param style       UITableViewCellStyle
 *  @param indentifier indentifier
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style indentifier:(NSString *)indentifier;
/**
 *  创建 cell
 *
 *  @param tableView    所属tableView
 *  @param indentifier indentifier
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellDefaultWithTableView:(UITableView *)tableView indentifier:(NSString *)indentifier;

@end
