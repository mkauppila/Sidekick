// CGPointTest.m
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

#import <GHUnit.h>

#import "CGPointAdditions.h"

@interface CGPointTest : GHTestCase { }
@end

@implementation CGPointTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testAddition
{
	CGPoint point1 = CGPointMake(1.0f, 1.0f);
	CGPoint point2 = CGPointMake(2.0f, 1.5f);
	CGPoint expected = CGPointMake(3.0f, 2.5f);
	
	CGPoint result = CGPointAdd(point1, point2);
	
	GHAssertTrue(CGPointEqualToPoint(result, expected), @"");
}

- (void)testSubtract
{
	CGPoint point1 = CGPointMake(3.0f, 2.0f);
	CGPoint point2 = CGPointMake(1.0f, 1.5f);
	CGPoint expected = CGPointMake(2.0f, 0.5f);
	
	CGPoint result = CGPointSubtract(point1, point2);
	
	GHAssertTrue(CGPointEqualToPoint(result, expected), @"");
}

- (void)testLength
{
	CGPoint point = CGPointMake(1.0f, 1.0f);
	const CGFloat expected = 1.4142f;
	const CGFloat actual = CGPointLength(point);
	//GHAssertEquals(expected, actual, @"");
	GHAssertEqualsWithAccuracy(expected, actual, 0.001, @"");
}

@end

