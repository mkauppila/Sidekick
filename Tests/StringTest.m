// StringTest.m
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

#import "NSString+Sidekick.h"

@interface StringTest : GHTestCase { }
@end

@implementation StringTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testDocumentsPath
{
	NSString *directory = [@"filename" asDocumentsPath];
	NSString *const correctResult = @"/Documents/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated documents path is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testLibraryPath
{
	NSString *directory = [@"filename" asLibraryPath];
	NSString *const correctResult = @"/Library/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated library path is incorrect. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testBundlePath
{
	NSString *directory = [@"filename" asBundlePath];
	NSString *const correctResult = @".app/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated bundle path is incorrect. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testDocumentsPathWithExtension
{
	NSString *directory = [@"filename" asDocumentsPathWithExtension:@"png"];
	NSString *const correctResult = @"/Documents/filename.png";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated documents path with extension is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testLibraryPathWithExtension
{
	NSString *directory = [@"filename" asLibraryPathWithExtension:@"png"];
	NSString *const correctResult = @"/Library/filename.png";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated library path with extension is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

@end
