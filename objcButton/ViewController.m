//
//  ViewController.m
//  objcButton
//
//  Created by MacAir on 2016/11/25.
//  Copyright © 2016年 snjj8000. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+YCTarget.h"
#import "NSNotificationCenter+YCTarget.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通知1
    [[NSNotificationCenter defaultCenter] targetName:@"nameleft" withBlock:^(NSNotification *notification) {
        NSLog(@"左边按扭触发了通知");
    }];
    //通知2
    [[NSNotificationCenter defaultCenter] targetName:@"nameright" withBlock:^(NSNotification *notification) {
        NSLog(@"右边按扭触发了通知");
    }];
    
    //左边按扭
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 64, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn targetBackCall:^(UIButton *button) {
        NSLog(@"left:%@",[NSDate date]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"nameleft" object:nil];
    }];
    
    //右边按扭
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(225, 64, 100, 100);
    btn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn2];
    [btn2 targetBackCall:^(UIButton *button) {
        NSLog(@"right:%@",[NSDate date]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"nameright" object:nil];
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"左边和右边按扭 移除通知,再返回来时点击按扭已不再触发通知");
    [[NSNotificationCenter defaultCenter] removeTarget:@[@"nameright",@"nameleft"]];
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
