//
//  ZXSimpleRequest.h
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ZXRequestConstant.h"
/**
 进一步封装隐藏请求细节
 */
typedef void(^ZXSimpleRequsetCompletionHandle)(BOOL isSuccess, id response, NSString *message);

@interface ZXSimpleRequest : NSObject

// 请求的 url
@property (nonatomic, copy) NSString *url;

// 请求类型
@property (nonatomic,assign) ZXRequestMethodType methodType;

// 请求的参数
@property (nonatomic, strong) NSDictionary *requestParams;



/**
 发起一个网络请求

 @param complectionHandle 完成回调, 成功返回成功, 失败返回 error.
 */
- (void)sendSimpleRequestWithCompletion:(ZXSimpleRequsetCompletionHandle)complectionHandle;


@end
