//
//  MainTableViewModel.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "MainTableViewModel.h"
#import "MainModel.h"

@implementation MainTableViewModel

-(void)fetchValue:(NSDictionary *)parameter{
    NSDictionary *_parameter = @{@"categoryIds": @"15",
                                 @"pageIndex":@"1"};
    [[HTTPRequest shareManager] NetRequestGETWithRequestURL:@"http://m.dabaidoctor.com/health/treat/category/doctorlist" WithParameter:_parameter WithReturnValeuBlock:^(id returnBlock) {
        [self fetchSuccessDict:returnBlock];
    } WithFailureBlock:^(id failBlock) {
        self.failBlock(@"");
    }];
}

-(void)fetchSuccessDict:(NSDictionary *)returnValue{
    NSArray *statuses=returnValue[@"result"][@"doctors"];
    NSMutableArray *modelArray=[[NSMutableArray alloc]initWithCapacity:0];
   // __weak typeof(self) weakSelf = self;
    [statuses enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       // __strong typeof(weakSelf) strongSelf = self;
        MainModel *model=[MainModel initWithDictionary:(NSDictionary *)obj];
        [modelArray addObject:model];
    }];
    self.returnBlock(modelArray);
    
}

@end
