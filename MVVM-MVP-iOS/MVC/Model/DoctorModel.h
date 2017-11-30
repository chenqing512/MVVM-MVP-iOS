//
//  DoctorModel.h
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/30.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorModel : NSObject

@property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *weiboId;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,strong) NSURL *imageUrl;
@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) CGFloat cellHeight;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(instancetype)initWithDictionary:(NSDictionary *)dict;

@end
