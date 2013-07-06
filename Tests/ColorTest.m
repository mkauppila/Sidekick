// ColorTest.m
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

#import <GHUnitIOS/GHUnit.h> 

#import "UIColor+Sidekick.h"

@interface ColorTest : GHTestCase { }
@end

@implementation ColorTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testCreateWithHexNoAlpha
{
	UIColor *newColor = [UIColor colorWithHex:@"FFFFFF"];

	CGFloat red, green, blue, alpha;
	BOOL didConvert = [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
	GHAssertTrue(didConvert, @"Color couldn't be converted to RGB format");
	
	GHAssertEquals(red,   1.0f, @"Color is white, so red component needs to be 1.0f");
	GHAssertEquals(green, 1.0f, @"Color is white, so green component needs to be 1.0f");
	GHAssertEquals(blue,  1.0f, @"Color is white, so blue component needs to be 1.0f");
	GHAssertEquals(alpha, 1.0f, @"Created from RGB integers, so alpha defaults to 1.0f");
}

- (void)testCreateFromHexWithAlpha
{
	UIColor *newColor = [UIColor colorWithHex:@"FFFFFFFF"];
	
	CGFloat red, green, blue, alpha;
	BOOL didConvert = [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
	GHAssertTrue(didConvert, @"Color couldn't be converted to RGB format");
	
	GHAssertEquals(red,   1.0f, @"Color is white, so red component needs to be 1.0f");
	GHAssertEquals(green, 1.0f, @"Color is white, so green component needs to be 1.0f");
	GHAssertEquals(blue,  1.0f, @"Color is white, so blue component needs to be 1.0f");
	GHAssertEquals(alpha, 1.0f, @"Created from RGB integers, so alpha defaults to 1.0f");
}

- (void)testCreateWithIntegerRGB
{
	UIColor *newColor = [UIColor colorWithIntegerRed:255 green:255 blue:255];
	
	CGFloat red, green, blue, alpha;
	BOOL didConvert = [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
	GHAssertTrue(didConvert, @"Color couldn't be converted to RGB format");
	
	GHAssertEquals(red,   1.0f, @"Color is white, so red component needs to be 1.0f");
	GHAssertEquals(green, 1.0f, @"Color is white, so green component needs to be 1.0f");
	GHAssertEquals(blue,  1.0f, @"Color is white, so blue component needs to be 1.0f");
	GHAssertEquals(alpha, 1.0f, @"Created from RGB integers, so alpha defaults to 1.0f");
	
	GHTestLog(@"Color crated successfully from RGBa integers");
}

- (void)testCreateWithIntegerRGBA
{
	UIColor *newColor = [UIColor colorWithIntegerRed:255 green:255 blue:255 alpha:255];
	
	CGFloat red, green, blue, alpha;
	BOOL didConvert = [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
	GHAssertTrue(didConvert, @"Color couldn't be converted to RGB format");
	
	GHAssertEquals(red,   1.0f, @"Color is white, so red component needs to be 1.0f");
	GHAssertEquals(green, 1.0f, @"Color is white, so green component needs to be 1.0f");
	GHAssertEquals(blue,  1.0f, @"Color is white, so blue component needs to be 1.0f");
	GHAssertEquals(alpha, 1.0f, @"Color is white, so alpha component needs to be 1.0f");
	
	GHTestLog(@"Color crated successfully from RGBA integers");
}

@end
