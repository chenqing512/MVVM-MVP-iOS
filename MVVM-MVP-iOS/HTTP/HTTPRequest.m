//
//  HTTPRequest.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

+(instancetype)shareManager{
    static HTTPRequest *request=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request=[[HTTPRequest alloc]init];
    });
    return request;
}

/**
 GET请求方式
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
-(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                     WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnResponseBlock) block
                  WithFailureBlock:(FailBlock) failureBlock
{
    
    
    
    DDLog(@"\n\nruquestUrl=%@\n 参数=%@",requestURLString,parameter);
    requestURLString=[requestURLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [[AFHTTPSessionManager manager] GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        DDLog(@"request=%@,response=%@",requestURLString,responseObject);
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        // callbackBlock(@"请求 Error:");
        failureBlock(nil);
    }];
    /*
    NSMutableDictionary *allParameter = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    [[AFHTTPSessionManager manager] GET:requestURLString parameters:allParameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLog(@"%@",error.description);
        failureBlock(nil);
    }];
    */
}

/**
 POST请求方式
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
-(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnResponseBlock) block
                   WithFailureBlock:(FailBlock) failureBlock
{
    
    [[AFHTTPSessionManager manager] POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(nil);
    }];
}

@end
