//
//  NSDate+Sidekick.m
//  Vesi
//
//  Created by markus on 26.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "NSDate+Sidekick.h"

@implementation NSDate (Sidekick)

// http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
+ (NSDate *)dateFromHttpDate:(NSString *)dateString
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
	dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
	dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	return [dateFormatter dateFromString:dateString];
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

@end
