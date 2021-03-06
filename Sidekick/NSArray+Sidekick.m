//  NSArray+Sidekick.m
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

#import "NSArray+Sidekick.h"

@implementation NSArray (Sidekick)

- (id)firstObject
{
	id object = nil;
	if (self.count > 0) {
		object = [self objectAtIndex:0];
	}
	return object;
}

- (BOOL)isEmpty { return self.count == 0 ? YES : NO; }

- (NSArray *)map:(id (^)(id value))block
{
	NSMutableArray *array = [NSMutableArray array];
	for (id element in self) {
		[array addObject:block(element)];
	}
	
	return array;
}

- (NSArray *)filteredArrayUsingBlock:(BOOL (^)(id value))block
{
	NSMutableArray *array = [NSMutableArray array];
	for (id element in self) {
		if (block(element)) {
			[array addObject:element];
		}
	}
	
	return array;
}

@end
