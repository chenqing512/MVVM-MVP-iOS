//
//  HTTPRequest.h
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ReturnResponseBlock)(id returnBlock);

typedef void(^ErrorResponseBlock)(id errorCode);

typedef void(^FailBlock)(id failBlock);

typedef void(^NetWorkBlock)(BOOL netConnectState);//网络状态

@interface HTTPRequest : NSObject

+(instancetype)shareManager;

#pragma POST请求
-(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnResponseBlock) block
                   WithFailureBlock:(FailBlock) failureBlock;

#pragma GET请求
-(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                     WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnResponseBlock) block
                  WithFailureBlock:(FailBlock) failureBlock;

@end
