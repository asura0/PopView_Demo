//
//  PopView.h
//  PopView
//
//  Created by 123 on 16/4/29.
//  Copyright © 2016年 asura. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^successBlock)();
typedef void(^failureBlock)();

@interface PopView : UIButton

@property (nonatomic, copy) successBlock success;
@property (nonatomic, copy) failureBlock failure;


+ (void)initWithTitle:(NSString *)title success:(void (^)())success failure:(void (^)())failure;

@end
