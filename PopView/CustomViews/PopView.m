//
//  PopView.m
//  PopView
//
//  Created by 123 on 16/4/29.
//  Copyright © 2016年 asura. All rights reserved.
//

#import "PopView.h"

#define kScreenFrame [UIScreen mainScreen].bounds

@interface PopView ()

@property (nonatomic, strong) UIWindow *window;
//中央提示视图
@property (nonatomic, strong) UIView *centerView;
//底层背景视图
@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation PopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)initConfgure{
 
//    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    self.centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    self.centerView.center = self.window.center;
    self.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.centerView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.backgroundColor = [UIColor brownColor];
    [self addSubview:button];
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleAction:(UIButton *)sender{
    self.success ? self.success() : nil;
}

+ (void)initWithTitle:(NSString *)title success:(void (^)())success failure:(void (^)())failure{
    PopView *popView = [[PopView alloc]initWithFrame:kScreenFrame];
    popView.window = [UIApplication sharedApplication].keyWindow;
    [popView.window addSubview:popView];
    popView.backgroundColor = [UIColor redColor];

    [popView initConfgure];
    popView.success = success;
    popView.failure = failure;
}

@end
