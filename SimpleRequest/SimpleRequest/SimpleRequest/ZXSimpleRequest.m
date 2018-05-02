//
//  ZXSimpleRequest.m
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ZXSimpleRequest.h"
#import "YYModel.h"
#import "ZXRequestManager.h"

@implementation ZXSimpleRequest

- (void)sendSimpleRequestWithCompletion:(ZXSimpleRequsetCompletionHandle)complectionHandle {
    
    // 提前验证表单数据
    if (!_url || !_url.length) return;
    
    [ZXRequestManager requestWithURLString:_url
                                    params:[self filterParams] methodType:self.methodType serializerType:ZXRespondseSerializerJSON successHandle:^(NSURLSessionTask *task, id response) {
                                        !complectionHandle ? : complectionHandle(YES, response, nil);
                                    } failureHandle:^(NSURLSessionTask *task, NSError *error) {
                                        !complectionHandle ? : complectionHandle(NO, nil, error.description);
                                    }];
}

// 真正的使用方式是继承当前类 创建 model, 然后 model 的属性作为参数进行网络请求.
- (NSDictionary *)filterParams {
    
    // 将整个对象转为一个字典
    NSDictionary *json = self.yy_modelToJSONObject;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *params = [(NSDictionary *)json mutableCopy];
        // 将参数字典当中的键值对加入到 params 字典当中
        [params addEntriesFromDictionary:self.requestParams];
        // 遍历属性键值 移除自身属性
        for (NSString *delKey in @[@"url", @"methodType", @"requestParams"]) {
            if ([params.allKeys containsObject:delKey]) {
                [params removeObjectForKey:delKey];
            }
        }
        
        // 移除空键值对
        for (id key in params.allKeys) {
            id obj = [params objectForKey:key];
            if (!obj || [obj isKindOfClass:[NSNull class]] || obj == (id)kCFNull) {
                [params removeObjectForKey:key];
            }
        }
        return params;
    }
    return self.requestParams;
}


@end
