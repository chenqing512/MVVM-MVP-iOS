//
//  DoctorPresenter.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/30.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "DoctorPresenter.h"
#import "MainModel.h"

@interface DoctorPresenter()
//weak  防止循环引用
@property (nonatomic,weak) id<DoctorPresenterProtocol> view;

@end

@implementation DoctorPresenter

-(void)bindView:(id<DoctorPresenterProtocol>)view{
    _view=view;
}

-(void)fetchData{
    [self getUserData];
}
-(void)getUserData{
    NSDictionary *_parameter = @{@"categoryIds": @"15",
                                 @"pageIndex":@"1"};
    [[HTTPRequest shareManager] NetRequestGETWithRequestURL:@"http://m.dabaidoctor.com/health/treat/category/doctorlist" WithParameter:_parameter WithReturnValeuBlock:^(id returnBlock) {
        [self fetchSuccessDict:returnBlock];
    } WithFailureBlock:^(id failBlock) {
        
    }];
}

-(void)fetchSuccessDict:(NSDictionary *)dict{
    NSArray *statuses=dict[@"result"][@"doctors"];
    NSMutableArray *modelArray=[[NSMutableArray alloc]initWithCapacity:0];
    [statuses enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // __strong typeof(weakSelf) strongSelf = self;
         MainModel*model=[MainModel initWithDictionary:(NSDictionary *)obj];
        [modelArray addObject:model];
    }];
    [_view userDoctorData:modelArray];
}
@end
