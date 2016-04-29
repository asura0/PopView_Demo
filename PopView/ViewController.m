//
//  ViewController.m
//  PopView
//
//  Created by 123 on 16/4/29.
//  Copyright © 2016年 asura. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "MBProgressHUD.h"
#import "MianViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@------%@",[UIApplication sharedApplication].windows,[UIApplication sharedApplication].keyWindow);
    
    [PopView initWithTitle:nil success:^{
        NSLog(@"xxxx");
    } failure:^{
        NSLog(@"ssss");
    }];
    
    MianViewController *mainVC = [[MianViewController alloc]init];
    [self presentViewController:mainVC animated:YES completion:nil];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
