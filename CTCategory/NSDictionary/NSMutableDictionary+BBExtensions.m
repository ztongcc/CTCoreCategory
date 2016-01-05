//
// Copyright 2013 BiasedBit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

//
//  Created by Bruno de Carvalho (@biasedbit, http://biasedbit.com)
//  Copyright (c) 2013 BiasedBit. All rights reserved.
//

#import "NSMutableDictionary+BBExtensions.h"



#pragma mark -

@implementation NSMutableDictionary (BBExtensions)


#pragma mark Shortcuts

- (void)setObjectIfNotNil:(id)object forKey:(id<NSCopying>)key
{
    if (object == nil) return;

    self[key] = object;
}

- (void)setUnsignedShort:(unsigned short)value forKey:(id<NSCopying>)key
{
    self[key] = [NSNumber numberWithUnsignedShort:value];
}

- (void)setUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)key
{
    self[key] = [NSNumber numberWithUnsignedInteger:value];
}

- (void)setUnsignedLongLong:(unsigned long long)value forKey:(id<NSCopying>)key
{
    self[key] = [NSNumber numberWithUnsignedLongLong:value];
}

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)key
{
    self[key] = [NSNumber numberWithBool:value];
}
@end

@implementation NSDictionary (BBExtensions)
- (NSDictionary *)filterNull
{
    @autoreleasepool {
        if ([self isEqual:[NSNull null]] || self == nil) {
            return nil;
        }
        NSMutableDictionary * resultDict = [NSMutableDictionary dictionaryWithCapacity:1];
        NSEnumerator * enumerator = [self keyEnumerator];
        id key = [enumerator nextObject];
        while (key) {
            
            if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
                [resultDict setObject:@"" forKey:key];
            }else if ([[self objectForKey:key] isKindOfClass:[NSNumber class]]){
                [resultDict setObject:[NSString stringWithFormat:@"%@",[self objectForKey:key]] forKey:key];
            }else {
                [resultDict setObject:[self objectForKey:key] forKey:key];
            }
            key = [enumerator nextObject];
        }
        return [resultDict copy];
    }
}

- (nullable instancetype)safeObjectForKey:(nullable NSString *)aKey
{
    if (self == nil || self == NULL || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    if (aKey == nil || aKey == NULL || [aKey isKindOfClass:[NSNull class]]) {
        return nil;
    }
    if ([self isKindOfClass:[NSDictionary class]] && [[self allKeys] count] != 0) {
        if ([[self allKeys] containsObject:aKey]) {
            return  [self objectForKey:aKey];
        }
        return nil;
    }
    return nil;
}
@end
