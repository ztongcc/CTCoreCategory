//
//  UITableViewCell+Extend.m
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "UITableViewCell+Extend.h"
#import "UIView+Extend.h"

@implementation UITableViewCell (Extend)

+ (instancetype)ct_cellWithTableViewFromXIB:(UITableView *)tableView indentifier:(NSString *)indentifier
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if(cell == nil){
        cell = [self viewFromXIB];
    }
    return cell;
}

+ (instancetype)ct_cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style indentifier:(NSString *)indentifier
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:indentifier];
    }
    return cell;
}

@end
