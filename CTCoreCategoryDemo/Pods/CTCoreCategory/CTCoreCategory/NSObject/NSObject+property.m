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

+ (void)MethodSwizzleSelector:(SEL)sourceSel withClass:(Class)ofClass selector:(SEL)toSelector
{
    if (sourceSel == nil || toSelector == nil || ofClass == nil) {
        return;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = self.class;
        Method source = class_getInstanceMethod(class, sourceSel);
        Method result = class_getInstanceMethod(ofClass, toSelector);
        
        IMP source_imp = method_getImplementation(source);
        IMP result_imp = method_getImplementation(result);
        
        //添加实现，但不会覆盖之前的实现
        BOOL didAddMethod = class_addMethod(class, sourceSel, result_imp, method_getTypeEncoding(result));
        if (didAddMethod) {
            class_replaceMethod(ofClass, toSelector, source_imp, method_getTypeEncoding(source));
        } else {
            method_exchangeImplementations(source, result);
        }
    });
}


+ (void)MethodSwizzleSelector:(SEL)sourceSel withSelector:(SEL)toSelector
{
    if (sourceSel == nil || toSelector == nil) {
        return;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = self.class;
        Method source = class_getInstanceMethod(class, sourceSel);
        Method result = class_getInstanceMethod(class, toSelector);
        
        IMP source_imp = method_getImplementation(source);
        IMP result_imp = method_getImplementation(result);
        
        //添加实现，但不会覆盖之前的实现
        BOOL didAddMethod = class_addMethod(class, sourceSel, result_imp, method_getTypeEncoding(result));
        if (didAddMethod) {
            class_replaceMethod(class, toSelector, source_imp, method_getTypeEncoding(source));
        } else {
            method_exchangeImplementations(source, result);
        }
    });
}


@end
