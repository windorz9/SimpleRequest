//
//  ViewController.m
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserModel *user = [[UserModel alloc] init];
    user.access_token = 123456789;
    user.methodType = ZXRequestMethodTypeGET;
    
    [user sendSimpleRequestWithCompletion:^(BOOL isSuccess, id response, NSString *message) {
        if (isSuccess) {
            NSLog(@"请求成功");
        } else {
            NSLog(@"请求失败, error = %@", message);
        }
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
