//
//  NSNotificationCenter+YCTarget.m
//  objcButton
//
//  Created by MacAir on 2016/11/25.
//  Copyright © 2016年 snjj8000. All rights reserved.
//

#import "NSNotificationCenter+YCTarget.h"

@interface NSNotificationCenter ()

/**
 保存通知对象事件
 */
@property (nonatomic,strong) NSMutableDictionary * _Nonnull notiDic;

@end

@implementation NSNotificationCenter (YCTarget)

/**
 给分类绑定属性，设置set方法
 
 */
- (void)setNotiDic:(NSMutableDictionary *)notiDic{
    objc_setAssociatedObject(self, @selector(notiDic), notiDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 给分类绑定属性，设置get方法
 */
- (NSMutableDictionary *)notiDic{
    return objc_getAssociatedObject(self, @selector(notiDic));
}

/**
 设置通知
 
 @param name 通知名字
 @param block 通知响应事件，具体实现
 */
- (void)targetName:(NSString *)name withBlock:(void (^)(NSNotification *notification))block{
    if (!self.notiDic) {
        self.notiDic = [NSMutableDictionary dictionary];
    }
    NSArray *keys = [self.notiDic allKeys];
    if (![keys containsObject:name]) {
        [self.notiDic setObject:block forKey:name];
        [self addObserver:self selector:@selector(notification:) name:name object:nil];
    }
}


/**
 通知响应，在些回调事件

 @param notification 区分通知
 */
- (void)notification:(NSNotification *)notification{
    NSString *notiName = notification.name;
    NSArray *keys = [self.notiDic allKeys];
    if ([keys containsObject:notiName]) {
        void (^block)(NSNotification *) = [self.notiDic objectForKey:notiName];
        if (block) {
            block(notification);
            return;
        }
    }
}
/**
 移除通知
 
 @param notiNameArray 需要移除通知的名字
 */
- (void)removeTarget:(nonnull NSArray<NSString *> *)notiNameArray{
    for (NSString *notiName in notiNameArray) {
        [self removeObserver:self name:notiName object:nil];
        NSArray *keys = [self.notiDic allKeys];
        if ([keys containsObject:notiName]) {
            [self.notiDic removeObjectForKey:notiName];
        }
    }
}
@end


