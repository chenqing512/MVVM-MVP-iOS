//
//  DoctorModel.m
//  MVVM-MVP-iOS
//
//  Created by ChenQing on 2017/11/30.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#import "DoctorModel.h"

@implementation DoctorModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self=[super init]) {
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[NSDate date];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        _date = [resultFormatter stringFromDate:date];
        _userName = dict[@"realName"];
        _text = dict[@"summary"];
        _imageUrl = [NSURL URLWithString:dict[@"logo"]];
        _userId = dict[@"patientsCount"];
        _weiboId = dict[@"patientsCount"];
        _cellHeight = [self countTextHeight:_text width:40 font:14] + 150;
    }
    return self;
}

+(instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[DoctorModel alloc]initWithDictionary:dict];
}


- (CGFloat)countTextHeight:(NSString *)text
                     width:(CGFloat) width
                      font:(CGFloat) fontSize
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - width, CGFLOAT_MAX) options:options context:nil];
    return rect.size.height;
}

@end
