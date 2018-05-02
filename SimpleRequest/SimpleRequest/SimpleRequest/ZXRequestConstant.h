//
//  ZXRequestConstant.h
//  SimpleRequest
//
//  Created by windorz on 2018/5/2.
//  Copyright © 2018年 windorz. All rights reserved.
//

#ifndef ZXRequestConstant_h
#define ZXRequestConstant_h

#import <Foundation/Foundation.h>


// 数据解析类型, 使用对应的类型, 服务器对应返回相应类型的数据
typedef NS_ENUM(NSUInteger, ZXResponseSerializerType) {
    
    // 默认 JSON
    ZXRespondseSerializerDefault,
    
    // JSON
    ZXRespondseSerializerJSON,
    
    // XML
    ZXRespondseSerializerXML,
    
    // Plist
    ZXRespondseSerializerPlist,
    
    // Compound
    ZXRespondseSerializerCompound,
    
    // Image
    ZXRespondseSerializerImage,
    
    // Data
    ZXRespondseSerializerData
};

// 请求方式
typedef NS_ENUM(NSUInteger, ZXRequestMethodType) {
    
    // GET 请求
    ZXRequestMethodTypeGET,
    
    // POST 请求
    ZXRequestMethodTypePOST,
    
    // PUT 请求
    ZXRequestMethodTypePUT,
    
    // DELETE 请求
    ZXRequestMethodTypeDELETE,
    
    // PATCH 请求
    ZXRequestMethodTypePATCH,
    
    // HEAD 请求
    ZXRequestMethodTypeHEAD,
};

#endif /* ZXRequestConstant_h */
