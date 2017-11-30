//
//  DoctorPresenter.h
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/30.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DoctorPresenterProtocol <NSObject>

@optional

-(void)userDoctorData:(NSMutableArray *)array;

@end;
/*
 Presenter 与具体的 View 是没有直接关联的，而是通过定义好的接口进行交互，从而使得在变更 View 时候可以保持 Presenter 的不变，即重用！
 */
@interface DoctorPresenter : NSObject
//绑定协议view
-(void)bindView:(id <DoctorPresenterProtocol>)view;
//获取数据
-(void)fetchData;

@end
