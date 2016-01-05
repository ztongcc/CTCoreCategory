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

#pragma mark -
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (BBExtensions)


#pragma mark Shortcuts

- (void)setObjectIfNotNil:(_Nullable id)object forKey:(_Nullable id<NSCopying>)key;
- (void)setUnsignedShort:(unsigned short)value forKey:(_Nullable id<NSCopying>)key;
- (void)setUnsignedInteger:(NSUInteger)value forKey:(_Nullable id<NSCopying>)key;
- (void)setUnsignedLongLong:(unsigned long long)value forKey:(_Nullable id<NSCopying>)key;
- (void)setBool:(BOOL)value forKey:(_Nullable id<NSCopying>)key;

@end


@interface NSDictionary (BBExtensions)
// 过滤掉字典中的Null
- (NSDictionary * _Nullable)filterNull;

- (nullable instancetype)safeObjectForKey:(nullable NSString *)aKey;

@end
