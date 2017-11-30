//
//  MainTableViewCell.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/29.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "MainTableViewCell.h"
#import "MainModel.h"

@interface MainTableViewCell()

@property (nonatomic,strong) UILabel *userName;

@property (nonatomic,strong) UILabel *date;

@property (nonatomic,strong) UIImageView *headImg;

@property (nonatomic,strong) UITextView *weiboText;

@end;

@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutView];
    }
    return self;
}

-(void)layoutView{
    _headImg=[[UIImageView alloc]initWithImage:nil];
    [self addSubview:_headImg];
    _userName=[[UILabel alloc]initWithFrame:CGRectZero];
    _userName.font=[UIFont systemFontOfSize:17];
    _userName.textColor=[UIColor blackColor];
    _userName.textAlignment=NSTextAlignmentLeft;
    [self addSubview:_userName];
    _date=[[UILabel alloc]initWithFrame:CGRectZero];
    _date.font=[UIFont systemFontOfSize:17];
    _date.textColor=[UIColor blackColor];
    _date.textAlignment=NSTextAlignmentLeft;
    [self addSubview:_date];
    _weiboText=[[UITextView alloc]initWithFrame:CGRectZero];
    //_weiboText.backgroundColor=[UIColor redColor];
    _weiboText.font=[UIFont systemFontOfSize:15];
    _weiboText.textColor=[UIColor blackColor];
    _weiboText.textAlignment=NSTextAlignmentLeft;
    [self addSubview:_weiboText];
}

-(void)layoutConstrains{
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(89);
        make.height.mas_equalTo(83.5);
    }];
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(26);
        make.left.mas_equalTo(_headImg.mas_right).offset(10);
        make.right.mas_equalTo(-20);
    }];
    [_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userName.mas_bottom).offset(10);
        make.left.mas_equalTo(_userName);
        make.right.mas_equalTo(-20);
    }];
    [_weiboText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headImg.mas_bottom).offset(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-10);
    }];
}

-(void)setDataWithModel:(MainModel *)model{
    _userName.text=model.userName;
    _date.text=model.date;
    _weiboText.text=model.text;
    [_headImg sd_setImageWithURL:model.imageUrl];
    [self layoutConstrains];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
