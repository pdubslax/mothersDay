//
//  UIColor+colorFromHexString.m
//  mothersDay
//
//  Created by Patrick Wilson on 5/9/15.
//  Copyright (c) 2015 Patrick Wilson. All rights reserved.
//

#import "UIColor+colorFromHexString.h"

@implementation UIColor (colorFromHexString)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
