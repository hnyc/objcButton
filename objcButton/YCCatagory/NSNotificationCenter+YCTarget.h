//
//  NSNotificationCenter+YCTarget.h
//  objcButton
//
//  Created by MacAir on 2016/11/25.
//  Copyright © 2016年 snjj8000. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSNotificationCenter (YCTarget)


/**
 设置通知

 @param name 通知名字
 @param block 通知响应事件，具体实现
 */
- (void)targetName:(NSString * _Nonnull)name withBlock:(void (^_Nonnull)(NSNotification * _Nonnull notification))block;

/**
 移除通知

 @param notiNameArray 需要移除通知的名字
 */
- (void)removeTarget:(nonnull NSArray<NSString *> *)notiNameArray;

@end
