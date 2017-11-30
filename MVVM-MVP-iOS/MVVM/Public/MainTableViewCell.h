//
//  MainTableViewCell.h
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainModel;
@interface MainTableViewCell : UITableViewCell

/**
 赋值

 @param model 
 */
-(void)setDataWithModel:(MainModel *)model;

@end
