//
//  NSTimer+WeakRetain.h
//  CTUIDemo
//
//  Created by Admin on 16/7/26.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakRetain)
/**
 *  初始化Timer对象, 加入到当前 RunLoop (Block 内用 __weak 修饰的self 以免释放不掉, 销毁时 调用invalidate 方法)
 *
 *  @param inTimeInterval 时间间隔
 *  @param inBlock        Block
 *  @param inRepeats      是否重复
 *
 *  @return
 */
+ (NSTimer *)ct_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                         block:(void (^)(NSTimer * timer, NSInteger doTimes))inBlock
                                       repeats:(BOOL)inRepeats;

/**
 *  初始化Timer对象, 未加入RunLoop中, 需手动添加
 *
 *  @param inTimeInterval 时间间隔
 *  @param inBlock        Block
 *  @param inRepeats      是否重复
 *
 *  @return
 */
+ (NSTimer *)ct_timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                block:(void (^)(NSTimer * timer, NSInteger doTimes))inBlock
                              repeats:(BOOL)inRepeats;

/**
 *  暂停
 */
- (void)ct_pause;
/**
 *  重新开始
 */
- (void)ct_resume;
/**
 *  几秒后重新开始
 */
- (void)ct_resumeAfterTimeInterval:(NSTimeInterval)inTimeInterval;

@end
