//
//  NSObject+property.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (property)

/**
 *  获得属性列表
 *
 *  @return
 */
+ (NSArray *)PropertyListArray;
/**
 *  获得属性列表
 *
 *  @return
 */
- (NSArray *)propertyListArray;
/**
 *  通过属性名获得值
 *
 *  @param propertyName 属性名
 *
 *  @return 属性值
 */
- (instancetype)captureValueWithPropertyName:(NSString *)propertyName;
/**
 *  将 Model 生成 dictionary
 *
 *  @param filter 需要过滤掉的属性
 *
 *  @return 字典
 */
- (NSDictionary *)dictionaryOfRuntimePropertiesWithFilter:(NSArray * (^)())filter;

@end
