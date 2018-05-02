//
//  ZXRequestManager.m
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ZXRequestManager.h"

@interface AFHTTPSessionManager (Shared)

+ (instancetype)shareManager;

@end

@implementation AFHTTPSessionManager (Shared)

+ (instancetype)shareManager {
    static AFHTTPSessionManager *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [AFHTTPSessionManager manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return _instance;

}

@end


@implementation ZXRequestManager

+ (void)requestWithURLString:(NSString *)URLString params:(NSDictionary *)params methodType:(ZXRequestMethodType)methodType serializerType:(ZXResponseSerializerType)serializerType successHandle:(ZXRequestManagerSuccessHandle)successHandle failureHandle:(ZXRequestManagerFailureHandle)failureHandle {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager shareManager];
    
    manager.responseSerializer = [self responseSerializerWithSerializerType: serializerType];
    
    switch (methodType) {
        case ZXRequestMethodTypeGET:
            [manager GET:URLString parameters:params progress:nil success:successHandle failure:failureHandle];
            break;
        case ZXRequestMethodTypePOST:
            [manager POST:URLString parameters:params progress:nil success:successHandle failure:failureHandle];
            break;
        case ZXRequestMethodTypePUT:
            [manager PUT:URLString parameters:params success:successHandle failure:failureHandle];
            break;
        case ZXRequestMethodTypeDELETE:
            [manager DELETE:URLString parameters:params success:successHandle failure:failureHandle];
            break;
        case ZXRequestMethodTypePATCH:
            [manager PATCH:URLString parameters:params success:successHandle failure:failureHandle];
            break;
        case ZXRequestMethodTypeHEAD:
            [manager HEAD:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task) {
                !successHandle ?: successHandle(task, nil);
            } failure:failureHandle];
            break;
    }
    
    
}


+ (void)POSTWithURLString:(NSString *)URLString params:(NSDictionary *)params serializerType:(ZXResponseSerializerType)serializerType requestBody:(void (^)(id<AFMultipartFormData>))requestBody successHandle:(ZXRequestManagerSuccessHandle)successHandle failureHandle:(ZXRequestManagerFailureHandle)failureHandle {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [self responseSerializerWithSerializerType:serializerType];
    
    [manager POST:URLString parameters:params constructingBodyWithBlock:requestBody progress:nil success:successHandle failure:failureHandle];

}


// 传入一个数据解析类型 返回一个响应类型
+ (AFHTTPResponseSerializer *)responseSerializerWithSerializerType:(ZXResponseSerializerType)serializerType {
    
    switch (serializerType) {
        case ZXRespondseSerializerDefault:
            return [AFJSONResponseSerializer serializer];
            break;
        case ZXRespondseSerializerJSON:
            return [AFJSONResponseSerializer serializer];
            break;
        case ZXRespondseSerializerXML:
            return [AFXMLParserResponseSerializer serializer];
            break;
        case ZXRespondseSerializerPlist:
            return [AFPropertyListResponseSerializer serializer];
            break;
        case ZXRespondseSerializerCompound:
            return [AFCompoundResponseSerializer serializer];
            break;
        case ZXRespondseSerializerImage:
            return [AFImageResponseSerializer serializer];
            break;
        case ZXRespondseSerializerData:
            return [AFHTTPResponseSerializer serializer];
            break;
        default:
            return [AFJSONResponseSerializer serializer];
            break;
    }

}



@end
