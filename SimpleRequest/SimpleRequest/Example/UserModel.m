//
//  UserModel.m
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.url = @"www.bilibili.com";
    }
    
    return self;

}

@end
