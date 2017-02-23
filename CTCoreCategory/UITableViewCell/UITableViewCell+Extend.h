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
 *  创建cell ( indentifier 默认为Cell 类名 )
 *
 *  @param tableView   所属tableView
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellWithTableViewFromXIB:(UITableView *)tableView;


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
 *  创建 cell ( indentifier 默认为Cell 类名 )
 *
 *  @param tableView   所属tableView
 *  @param style       UITableViewCellStyle
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
/**
 *  创建 cell
 *
 *  @param tableView    所属tableView
 *  @param indentifier indentifier
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellDefaultWithTableView:(UITableView *)tableView indentifier:(NSString *)indentifier;

/**
 *  创建 cell ( indentifier 默认为Cell 类名 )
 *
 *  @param tableView    所属tableView
 *
 *  @return cell实例
 */
+ (instancetype)ct_cellDefaultWithTableView:(UITableView *)tableView;

@end
