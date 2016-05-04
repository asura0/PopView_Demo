//
//  ViewController.m
//  PopView
//
//  Created by 123 on 16/4/29.
//  Copyright © 2016年 asura. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "MianViewController.h"

static NSString *indefier = @"cell";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:indefier];
}

#pragma mark UITableView datasourec && delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indefier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"正常的提示弹窗";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"输入密码弹窗";
    }
    if (indexPath.row == 2){
        cell.textLabel.text = @"评论弹窗";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"成功!";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"失败!";
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = @"正在加载!";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [PopView initWithTitle:@"提示" content:@"内容是" buttonTitle:@[@"确定",@"取消"] success:^{
            NSLog(@"点击了确定");
        } failure:^{
            NSLog(@"点击了取消");
        }];
    }
    if (indexPath.row == 1) {
        [PopView initWithPassword:@"请输入密码" buttonTitle:@[@"确定",@"取消"] message:^ (NSString *message){
             NSLog(@"密码确定输入,密码是:%@",message);
        } failure:^{
             NSLog(@"密码取消输入");
        }];
    }
    if (indexPath.row == 2) {
        [PopView initWithCommented:@"评论" buttonTitle:@[@"确定",@"取消"] message:^(NSString *message) {
            NSLog(@"确定评论,内容为:%@",message);
        } failure:^{
            NSLog(@"取消评论");
        }];
    }
    if (indexPath.row == 3) {
        [PopView initWithSuccessString:@"刷新成功!"];
    }
    if (indexPath.row == 4) {
        [PopView initWithFailureString:@"刷新失败!"];
    }
    if (indexPath.row == 5) {
        [PopView initWithWaitingString:@"请稍后..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [PopView dissmissPopview];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
