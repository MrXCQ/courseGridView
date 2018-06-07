//
//  UIColor+Chomp.m
//  kaipingzhuan
//
//  Created by Chomp on 16/7/7.
//  Copyright © 2016年 Chomp. All rights reserved.
//

#import "UIColor+Chomp.h"

@implementation UIColor (Chomp)
/**
 *  根据一个 16 进制的字符串生成对应的颜色值
 *
 *  @param string 表示颜色值的 16 进制字符串。
 *
 *  @return 生成的颜色值。
 */
+ (UIColor *)colorWithHex:(NSString *)string
{
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
    
    // 1.去掉 0x
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    // 2.去掉 #
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    // 3.加上 Alpha 值
    if ([cString length] == 6) {
        cString = [NSString stringWithFormat:@"FF%@",cString];
    }
    
    UIColor* color = [UIColor whiteColor];
    if ([cString length] == 8) {
        NSString* subString;
        unsigned int alpha,red, green, blue;
        
        // Alpha
        subString = [cString substringWithRange:NSMakeRange(0, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&alpha];
        // Red
        subString = [cString substringWithRange:NSMakeRange(2, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&red];
        // Green
        subString = [cString substringWithRange:NSMakeRange(4, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&green];
        // Blue
        subString = [cString substringWithRange:NSMakeRange(6, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&blue];
        
        // Build Color Value
        color = ARGB(alpha, red, green,blue);
    }
    
    return color;
}

+(UIColor *)colorWithHex:(NSString *)string andAlpha:(CGFloat )alpa
{
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
    
    // 1.去掉 0x
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    // 2.去掉 #
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    // 3.加上 Alpha 值
    if ([cString length] == 6) {
        cString = [NSString stringWithFormat:@"FF%@",cString];
    }
    
    UIColor* color = [UIColor whiteColor];
    if ([cString length] == 8) {
        NSString* subString;
        unsigned int alpha,red, green, blue;
        
        // Alpha
        subString = [cString substringWithRange:NSMakeRange(0, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&alpha];
        // Red
        subString = [cString substringWithRange:NSMakeRange(2, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&red];
        // Green
        subString = [cString substringWithRange:NSMakeRange(4, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&green];
        // Blue
        subString = [cString substringWithRange:NSMakeRange(6, 2)];
        [[NSScanner scannerWithString:subString] scanHexInt:&blue];
        
        // Build Color Value
        color = ARGB(alpa, red, green,blue);
    }
    
    return color;

    
}
+ (UIColor *)colorWithInteger:(NSInteger)colorValue
{
    if (colorValue > 0xFF000000) {
        return [UIColor colorWithRed:((float)((colorValue & 0xFF0000) >> 16))/255.0
                               green:((float)((colorValue & 0xFF00) >> 8))/255.0
                                blue:((float)(colorValue & 0xFF))/255.0
                               alpha:((float)((colorValue & 0xFF000000) >> 24))/255.0];
    } else {
        return [UIColor colorWithRed:((float)((colorValue & 0xFF0000) >> 16))/255.0
                               green:((float)((colorValue & 0xFF00) >> 8))/255.0
                                blue:((float)(colorValue & 0xFF))/255.0
                               alpha:1.0f];
    }
}

@end
