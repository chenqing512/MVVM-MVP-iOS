//
//  Header.h
//  Patient
//
//  Created by ChenQing on 17/9/12.
//  Copyright © 2017年 ChenQing. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define MAIN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define MAIN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define kGetHeight(w,h,norW) ((h)*(norW)/(w))


#define DDLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif /* Header_h */
