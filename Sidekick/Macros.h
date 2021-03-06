//  Macros.h
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
// @title Clamp macros

#import <Foundation/Foundation.h>

#define clamp(value, minimum, maximum) (MIN(MAX((minimum), (value)), (maximum)))

/// @name Common Constants

#define SECONDS_IN_HOUR (60 * 60)
#define SECONDS_IN_DAY  (60 * 60 * 24)
#define SECONDS_IN_WEEK (60 * 60 * 24 * 7)

/// @name Debug macros

// Copied from Cocoa Is My Girlfriend blog post
// (http://www.cimgf.com/2010/05/02/my-current-prefix-pch-file/)
// originally written by Marcus Zarra.

#ifdef DEBUG
	#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
	#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
	#define DLog(...) do { } while (0)
	#define ALog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif

#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); }} while(0)


/// @name Threading macros
/// Assert macros only work within objective-c methods

#ifdef DEBUG
#define AssertIsMainThread()  \
	do { \
	NSAssert([NSThread isMainThread], @"Not running in main thread"); \
	} while(0)
#define AssertIsBackgroundThread() \
	do { \
	NSAssert([NSThread isMainThread] == NO, @"Not running in background thread"); \
	} while(0)
#else
#define AssertIsMainThread() do {} while(0)
#define AssertIsBackgroundThread() do {} while (0)
#endif

