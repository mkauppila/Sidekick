//  UIColor+Sidekick.m
//
// Copyright (c) 2013 Markus Kauppila <markus.kauppila@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to  use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
