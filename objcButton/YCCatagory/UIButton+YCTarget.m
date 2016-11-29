//
//  UIButton+YCTarget.m
//  objcButton
//
//  Created by MacAir on 2016/11/25.
//  Copyright © 2016年 snjj8000. All rights reserved.
//

#import "UIButton+YCTarget.h"

@interface UIButton ()

/**
 保存具体事件
 */
@property (nonatomic,copy)void (^targetBlock)(UIButton *);

@end

@implementation UIButton (YCTarget)


/**
 给分类绑定属性，设置set方法
 
 */
- (void)setTargetBlock:(void (^)(UIButton *))targetBlock{
    objc_setAssociatedObject(self, @selector(targetBlock), targetBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 给分类绑定属性，设置get方法
 */
- (void (^)(UIButton *))targetBlock{
    return objc_getAssociatedObject(self, @selector(targetBlock));
}

/**
 按扭绑定事件
 
 @param block 要做的事
 */
- (void)targetBackCall:(void (^)(UIButton *))block{
    self.targetBlock = block;
    [self addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 按扭监听 在此方法里执行响应的事件

 @param button 点击的按扭
 */
- (void)buttonClickAction:(UIButton *)button{
    if (self.targetBlock) {
        self.targetBlock(button);
    }
}

@end
