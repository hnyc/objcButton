//
//  UIButton+YCTarget.h
//  objcButton
//
//  Created by MacAir on 2016/11/25.
//  Copyright © 2016年 snjj8000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (YCTarget)


/**
 按扭绑定事件

 @param block 要做的事
 */
- (void)targetBackCall:(void (^)(UIButton *button))block;

@end
