//
//  NSObject+property.m
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/runtime.h>

@implementation NSObject (property)

+ (NSArray *)PropertyListArray
{
    NSMutableArray * proAry = [NSMutableArray arrayWithCapacity:1];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        NSString * propName = [NSString stringWithUTF8String:property_getName(property)];
        [proAry addObject:propName];
    }
    free(propertyList);
    return proAry;
}

- (NSArray *)propertyListArray
{
    NSMutableArray * proAry = [NSMutableArray arrayWithCapacity:1];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        NSString * propName = [NSString stringWithUTF8String:property_getName(property)];
        [proAry addObject:propName];
    }
    free(propertyList);
    return proAry;
}

- (instancetype)captureValueWithPropertyName:(NSString *)propertyName
{
    id result = [self valueForKey:propertyName];
    return result;
}

- (NSDictionary *)dictionaryOfRuntimePropertiesWithFilter:(NSArray * (^)())filter
{
    @autoreleasepool {
        unsigned int outCount, i;
        NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:1];
            objc_property_t *properties = class_copyPropertyList([self class], &outCount);
            for (i = 0; i < outCount; i++) {
                objc_property_t property = properties[i];
                NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
                if (filter != nil && filter != NULL) {
                     NSArray * filterAry = filter();
                    if ([filterAry containsObject:propName]) {
                        continue;
                    }
                }
                id value = [self valueForKey:propName];
                if(value){
                    [dict setObject:value forKey:propName];
                }
            }
            free(properties);
            return [dict copy];
    }
}

@end
