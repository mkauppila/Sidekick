//
//  UIColor+Sidekick.m
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "UIColor+Sidekick.h"

typedef unsigned long ulong;

@implementation UIColor (Sidekick)

+ (UIColor *)colorWithHex:(NSString *)hexString
{
	// Remove '#' from the beginning
	hexString = [hexString substringFromIndex:1];
	const int baseNumber = 16;
	ulong rgba = strtoul([hexString UTF8String], NULL, baseNumber);
	DLog(@"%lul", rgba);
	return [UIColor colorWithRGBA:rgba];
}

+ (UIColor *)colorWithRGBA:(ulong)rgba
{
	CGFloat red   = ((rgba >> 24) & 255) / 255.0f;
	CGFloat green = ((rgba >> 16) & 255) / 255.0f;
	CGFloat blue  = ((rgba >> 8) & 255) / 255.0f;
	CGFloat alpha = (rgba & 255) / 255.0f;
	return [UIColor colorWithRed:red
						   green:green
							blue:blue
						   alpha:alpha];
}

@end
