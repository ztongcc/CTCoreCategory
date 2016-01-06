//
//  UIImage+Extend.m
//  Category
//
//  Created by Evan.Cheng on 15/12/26.
//  Copyright (c) 2015年 Cheng. All rights reserved.
//

#import "UIImage+Extend.h"
#import <objc/runtime.h>

static const void * CompleteBlockKey = &CompleteBlockKey;
static const void * FailBlockKey = &FailBlockKey;

@interface UIImage ()

@property (nonatomic,copy)  void(^CompleteBlock)();

@property (nonatomic,copy)  void(^FailBlock)();

@end


@implementation UIImage (Extend)


/**
 *  拉伸图片
 */
#pragma mark  拉伸图片:自定义比例
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftCap topCapHeight:image.size.height * topCap];
}




#pragma mark  拉伸图片
+(UIImage *)resizeWithImageName:(NSString *)name{
    
    return [self resizeWithImageName:name leftCap:.5f topCap:.5f];

}




/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
- (void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock{
    
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:),NULL);
    
    self.CompleteBlock = completeBlock;
    self.FailBlock = failBlock;
}




- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(error == nil){
        if(self.CompleteBlock != nil) self.CompleteBlock();
    }else{
        if(self.FailBlock !=nil) self.FailBlock();
    }
}



/*
 *  模拟成员变量
 */
-(void (^)())FailBlock{
    return objc_getAssociatedObject(self, FailBlockKey);
}
-(void)setFailBlock:(void (^)())FailBlock{
    objc_setAssociatedObject(self, FailBlockKey, FailBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void (^)())CompleteBlock{
    return objc_getAssociatedObject(self, CompleteBlockKey);
}

-(void)setCompleteBlock:(void (^)())CompleteBlock{
    objc_setAssociatedObject(self, CompleteBlockKey, CompleteBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
