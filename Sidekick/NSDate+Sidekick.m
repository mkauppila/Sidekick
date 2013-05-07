//
//  NSDate+Sidekick.m
//  Vesi
//
//  Created by markus on 26.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "NSDate+Sidekick.h"

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
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
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

@end
