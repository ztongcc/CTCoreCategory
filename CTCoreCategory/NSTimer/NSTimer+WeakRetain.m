
//
//  NSTimer+WeakRetain.m
//  CTUIDemo
//
//  Created by Admin on 16/7/26.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "NSTimer+WeakRetain.h"
#import <objc/runtime.h>

static char * KNStimerSecondChar;

@implementation NSTimer (WeakRetain)

+ (NSTimer *)ct_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer * timer, NSInteger second))inBlock repeats:(BOOL)inRepeats
{
    NSTimer * timer = [self ct_timerWithTimeInterval:inTimeInterval block:inBlock repeats:inRepeats];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+ (NSTimer *)ct_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer * timer, NSInteger second))inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(ct_executeSimpleBlock:) userInfo:block repeats:inRepeats];
    objc_setAssociatedObject(self, &KNStimerSecondChar, @(1), OBJC_ASSOCIATION_ASSIGN);
    return ret;
}

+ (void)ct_executeSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        NSNumber * seccond = objc_getAssociatedObject(self, &KNStimerSecondChar);
        void (^block)(NSTimer * timer, NSInteger second) = (void (^)(NSTimer * timer,NSInteger second))[inTimer userInfo];
        block(inTimer,[seccond integerValue]);
        objc_setAssociatedObject(self, &KNStimerSecondChar, @([seccond integerValue]+1), OBJC_ASSOCIATION_ASSIGN);
    }
}

- (void)ct_resume
{
    [self setFireDate:[NSDate date]];
}

- (void)ct_resumeAfterTimeInterval:(NSTimeInterval)inTimeInterval
{
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:inTimeInterval]];
}

- (void)ct_pause
{
    [self setFireDate:[NSDate distantFuture]];
}

@end
