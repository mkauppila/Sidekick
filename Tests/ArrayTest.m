// ArrayTest.m
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

#import "NSArray+Sidekick.h"

@interface ArrayTest : GHTestCase { }
@end

@implementation ArrayTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testFirstObject
{
	NSArray *array = @[@"first", @"second", @"third"];
	GHAssertEqualStrings([array firstObject], @"first", @"Should match the first item of array");
}

- (void)testIsEmpty
{
	NSArray *emptyArray = [NSArray array];
	GHAssertTrue([emptyArray isEmpty], @"Just created array ought to be empty");
	
	NSMutableArray *mutableEmptyArray = [NSMutableArray array];
	GHAssertTrue([mutableEmptyArray isEmpty], @"Just created mutable array ought to be empty");
	[mutableEmptyArray addObject:@(1)];
	GHAssertFalse([mutableEmptyArray isEmpty], @"Array should have one element");
}

- (void)testMap
{
	NSArray *array = @[@1, @2, @3, @4];
	NSArray *correctResult = @[@1, @4, @9, @16];
	
	NSArray *result = [array map:^id(id value) {
		return @([value integerValue] * [value integerValue]);
	}];

	GHAssertEquals(array.count, result.count, @"Count of array should say the same");
	for (NSUInteger counter = 0; counter < result.count; ++counter) {
		GHAssertEqualObjects([correctResult objectAtIndex:counter],
							 [result objectAtIndex:counter],
							 @"Elements should match");
	}
}

- (void)testFilteredArrayUsingBlock
{
	NSArray *array = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
	NSArray *correctResult = @[@2, @4, @6, @8, @10];
	
	NSArray *result = [array filteredArrayUsingBlock:^BOOL(id value) {
		return [value integerValue] % 2 == 0;
	}];
	
	for (NSUInteger counter = 0; counter < result.count; ++counter) {
		GHAssertEqualObjects([correctResult objectAtIndex:counter],
							 [result objectAtIndex:counter],
							 @"Elements should match");
	}
}

@end
