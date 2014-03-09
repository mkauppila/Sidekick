//  NSDate+Sidekick.m
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

#import "NSDate+Sidekick.h"

#import "Macros.h"

@implementation NSDate (Sidekick)

+ (NSDate *)dateFromHttpDate:(NSString *)dateString
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
	dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
	dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	return [dateFormatter dateFromString:dateString];
}

#pragma mark - Methods per date component

- (NSInteger)year
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
	return components.year;
}

- (NSInteger)month
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:self];
	return components.month;
}

- (NSInteger)day
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self];
	return components.day;
}

- (NSInteger)hour
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self];
	return components.hour;
}

- (NSInteger)minute
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self];
	return components.minute;
}

- (NSInteger)second
{
	NSDateComponents *components = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:self];
	return components.second;
}

#pragma mark -

- (NSDateComponents *)standardDateComponents
{
	const NSUInteger components = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
								  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
	return [[NSCalendar currentCalendar] components:components fromDate:self];
}

- (NSDate *)dateAsMidnight
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger componentFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *components = [calendar components:componentFlags
											   fromDate:self];
	return [calendar dateFromComponents:components];
}

- (BOOL)isSameDay:(NSDate *)date
{
	const NSUInteger dateComponentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	
	NSDateComponents *left  = [calendar components:dateComponentFlags fromDate:self];
	NSDateComponents *right = [calendar components:dateComponentFlags fromDate:date];
	
	return left.year == right.year && left.month == right.month && left.day == right.day;
}

- (NSString *)dateFormattedAs:(NSString *)dateFormat
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = dateFormat;
	return [formatter stringFromDate:self];
}

#pragma mark - 

+ (NSDate *)today
{
	return [NSDate date];
}

+ (NSDate *)yesterday
{
	return [NSDate dateWithTimeIntervalSinceNow:-SECONDS_IN_DAY];
}

+ (NSDate *)tomorrow
{
	return [NSDate dateWithTimeIntervalSinceNow:SECONDS_IN_DAY];
}

- (BOOL)isToday
{
	return [self isSameDay:[NSDate today]];
}

- (BOOL)isTomorrow
{
	return [self isSameDay:[NSDate tomorrow]];
}

- (BOOL)isYesterday
{
	return [self isSameDay:[NSDate yesterday]];
}

@end
