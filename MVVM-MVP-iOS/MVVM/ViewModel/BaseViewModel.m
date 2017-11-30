//
//  BaseViewModel.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(void)setReturnBlock:(ReturnResponseBlock)returnBlock FailBlock:(FailBlock)failBlock{
    
    _returnBlock=returnBlock;
    _failBlock=failBlock;
}

@end
