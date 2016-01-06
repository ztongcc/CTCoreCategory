//
//  UIImage+Extend.h
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)

/**
 *  拉伸图片:自定义比例
 */
+ (UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 *  拉伸图片
 */
+ (UIImage *)resizeWithImageName:(NSString *)name;

/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
- (void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;


@end
