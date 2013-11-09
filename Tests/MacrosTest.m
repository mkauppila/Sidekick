// MacrosTest.m
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

#import "Macros.h"

@interface MacrosTest : GHTestCase { }
@end

@implementation MacrosTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testClampingPositiveIntegers
{
	GHAssertTrue(clamp(5, 0, 10)  == 5, nil);
	GHAssertTrue(clamp(15, 0, 10) == 10, nil);
	GHAssertTrue(clamp(-5, 0, 10) == 0, nil);

	GHAssertTrue(clamp(-5, -10, 0)  == -5, nil);
	GHAssertTrue(clamp(15, -10, 0) == 0, nil);
	GHAssertTrue(clamp(-5, 0, 10) == 0, nil);
	
	GHAssertTrue(clamp(0, -5, 10) == 0, nil);
	GHAssertTrue(clamp(-10, -5, 10) == -5, nil);
	GHAssertTrue(clamp(15, -5, 10) == 10, nil);

	// Add stranger border cases
}

- (void)testClampingFloats
{
	GHAssertTrue(clamp(0.5f, 0.0f, 1.0f) == 0.5f, nil);
	GHAssertTrue(clamp(-1.0f, 0.0f, 1.0f) == 0.0f, nil);
	GHAssertTrue(clamp(2.0f, 0.0f, 1.0f) == 1.0f, nil);
	
	// Add more basic and some stranger border cases
}

@end
