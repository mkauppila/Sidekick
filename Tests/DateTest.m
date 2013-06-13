// DateTest.m
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

#import "NSDate+Sidekick.h"

@interface DateTest : GHTestCase
- (NSDate *)dateFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
					hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
@end

@implementation DateTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testIsSameDay
{
	NSDate *date1 = [self dateFromYear:2013 month:4 day:19 hour:19 minute:40 second:10];
	NSDate *date2 = [self dateFromYear:2013 month:4 day:19 hour:20 minute:21 second:49];
	GHTestLog(@"date1: %@", date1);
	GHTestLog(@"date2: %@", date2);
	
	GHAssertTrue([date1 isSameDay:date1], @"The day should match with itself");
	GHAssertTrue([date1 isSameDay:date2], @"The given days should be the same");
	
	NSDate *yesterday = [self dateFromYear:2013 month:4 day:18 hour:13 minute:45 second:12];
	GHTestLog(@"yesterday: %@", yesterday);
	GHAssertTrue([date1 isSameDay:yesterday] == NO, @"The given days should not be the same");
	
	NSDate *tomorrow = [self dateFromYear:2013 month:4 day:20 hour:04 minute:1 second:45];
	GHTestLog(@"tomororw: %@", tomorrow);
	GHAssertTrue([date1 isSameDay:tomorrow] == NO, @"The given days should not be the same");
}

- (void)testHttpDate
{
	NSString *httpDateString = @"Tue, 15 Nov 1994 08:12:31 GMT";
	NSDate *date = [NSDate dateFromHttpDate:httpDateString];
	GHTestLog(@"date: %@", date);
	
	// FIXME(mk): There's problem with time zone
	//			  it'll parse it to match the current time zone, instead for GMT
	
	const NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
									  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit |
									  NSWeekdayCalendarUnit;

	NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:date];
	GHAssertEquals(components.weekday, 3, @"Week day should be tuesday");
	GHAssertEquals(components.year, 1994, @"Year should be 1994");
	GHAssertEquals(components.month, 11, @"Month should be November");
	GHAssertEquals(components.day, 15, @"Day should be 15th");
	GHAssertEquals(components.hour, 8, @"Hour should be 8");
	GHAssertEquals(components.minute, 12, @"Minute should be 12");
	GHAssertEquals(components.second, 31, @"Seconds should be 31");
}

- (void)testSingleDateComponentHelpers
{
	NSDateComponents *components = [[NSDateComponents alloc] init];
	components.year = 2010;
	components.month = 3;
	components.day = 20;
	components.hour = 11;
	components.minute = 44;
	components.second = 30;
	NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];
	
	GHAssertEquals(date.year,   2010, nil);
	GHAssertEquals(date.month,  3,    nil);
	GHAssertEquals(date.day,    20,   nil);
	GHAssertEquals(date.hour,   11,   nil);
	GHAssertEquals(date.minute, 44,   nil);
	GHAssertEquals(date.second, 30,   nil);
}

#pragma mark - helpers

- (NSDate *)dateFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
					hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
	NSDateComponents *components = [[NSDateComponents alloc] init];
	components.year = year;
	components.month = month;
	components.day = day;
	components.hour = hour;
	components.minute = minute;
	components.second = second;
	return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
