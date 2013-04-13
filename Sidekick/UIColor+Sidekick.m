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
	// Remove '#' from the beginning if present
	if ([hexString characterAtIndex:0] == '#') {
		hexString = [hexString substringFromIndex:1];
	}
	
	// Create itss
	const NSUInteger lenght = hexString.length;
	if (lenght == 8) {
		// nothing to do
	} else if (lenght == 6) {
		hexString = [hexString stringByAppendingString:@"ff"];
	} else {
		// Handle error: hex string has incorrect length.
		NSString *format = @"Given hex string (%@) has incorrect lenght: %d. "
							 "It should be either 8 or 6.";
		[NSException raise:@"Invalid hex string"
					format:format, hexString, lenght];
	}
	const int baseNumber = 16;
	ulong rgba = strtoul([hexString UTF8String], NULL, baseNumber);

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
