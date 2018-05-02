//
//  ZXRequestManager.h
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ZXRequestConstant.h"
#import "AFNetWorking.h"

typedef void(^ZXRequestManagerSuccessHandle)(NSURLSessionTask *task, id response);

typedef void(^ZXRequestManagerFailureHandle)(NSURLSessionTask *task, NSError *error);

@interface ZXRequestManager : NSObject


/**
 使用 NSURLSession 进行请求

 @param URLString URL 字符串
 @param params 请求参数字典
 @param methodType 请求方法
 @param serializerType 数据解析类型
 @param successHandle 成功回调
 @param failureHandle 失败回调
 */
+ (void)requestWithURLString:(NSString *)URLString
                      params:(NSDictionary *)params
                  methodType:(ZXRequestMethodType)methodType
              serializerType:(ZXResponseSerializerType)serializerType
               successHandle:(ZXRequestManagerSuccessHandle)successHandle
               failureHandle:(ZXRequestManagerFailureHandle)failureHandle;




/**
 使用 NSURLSession 进行带请求体的 POST 请求.

 @param URLString URL 字符串
 @param params 请求参数字典
 @param serializerType 请求方法
 @param requestBody 请求体
 @param successHandle 成功回调
 @param failureHandle 失败回调
 */
+ (void)POSTWithURLString:(NSString *)URLString
                   params:(NSDictionary *)params
           serializerType:(ZXResponseSerializerType)serializerType
              requestBody:(void (^)(id<AFMultipartFormData> formData))requestBody
            successHandle:(ZXRequestManagerSuccessHandle)successHandle
            failureHandle:(ZXRequestManagerFailureHandle)failureHandle;


@end
