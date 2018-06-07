//
//  UIColor+Chomp.h
//  kaipingzhuan
//
//  Created by Chomp on 16/7/7.
//  Copyright © 2016年 Chomp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Chomp)
#pragma mark Macors（宏）
#define ARGB(A,R,G,B)  ( [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A] )

/**
 *  根据一个 16 进制的字符串生成对应的颜色值
 *
 *  @param string 表示颜色值的 16 进制字符串。
 *
 *  @return 生成的颜色值。
 */
+ (UIColor *)colorWithHex:(NSString *)string;

/**
 *  根据一个 16 进制值对应的颜色
 *
 *  @param colorValue 颜色值
 *
 *  @return 生成的 UIColor 对象
 */
+ (UIColor *)colorWithInteger:(NSInteger)colorValue;

+(UIColor *)colorWithHex:(NSString *)string andAlpha:(CGFloat )alpa;
@end
