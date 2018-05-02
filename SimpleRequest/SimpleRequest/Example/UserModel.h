//
//  UserModel.h
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ZXSimpleRequest.h"

@interface UserModel : ZXSimpleRequest

@property (nonatomic, assign) NSInteger *userId;

@property (nonatomic, assign) NSInteger access_token;


@end
