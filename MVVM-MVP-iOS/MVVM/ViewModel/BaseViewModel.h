//
//  BaseViewModel.h
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property (nonatomic,copy) ReturnResponseBlock returnBlock;

@property (nonatomic,copy) FailBlock failBlock;

-(void)setReturnBlock:(ReturnResponseBlock)returnBlock
            FailBlock:(FailBlock)failBlock;

@end
