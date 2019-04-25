//
//  UIColor+Extension.m
//  MQweibo
//
//  Created by mac on 16/2/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+ (instancetype)randomColor {
    CGFloat r = (CGFloat)(arc4random() % 255) / 256.0;
    CGFloat g = (CGFloat)(arc4random() % 255) / 256.0;
    CGFloat b = (CGFloat)(arc4random() % 255) / 256.0;
    return [self colorWithRed:r green:g blue:b alpha:1];
    
}

@end
