//
//  NSDate+Sidekick.h
//  Vesi
//
//  Created by markus on 26.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Sidekick)

/**
 Convert date from http date format represented as string to 
 NSDate object.
 @return date object representing the given http date
 @see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for more information
 */
+ (NSDate *)dateFromHttpDate:(NSString *)dateString;

/**
 @return year component of the date
 */
- (NSInteger)year;

/**
 @return month component of the date
 */
- (NSInteger)month;

/**
 @return day component of the date
 */
- (NSInteger)day;

/**
 @return hour component of the date
 */
- (NSInteger)hour;

/**
 @return minute component of the date
 */
- (NSInteger)minute;

/**
 @return second component of the date
 */
- (NSInteger)second;

/**
 Dissect the date into year, month, day, hour, minute, second
 date components.
 @return Date represented as date components
 */
- (NSDateComponents *)standardDateComponents;

- (NSDate *)dateAsMidnight; // dateAsNextMidnight
// TODO: dateAsPreviousMidnihght

/**
 Compare the dates. The day will be same if year, month and day are
 the same.
 @return YES if the days are same, otherwise NO.
 
 @discussion Uses autoUpdatingCalendar, don't cache the result.
 */
- (BOOL)isSameDay:(NSDate *)date;

/**
 Create string representation of the date in given format.
 @return String representation of the date in the given date format
 
 @see [Date format patterns](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns) for
	  formatting options.
 */
- (NSString *)dateFormattedAs:(NSString *)dateFormat;

@end
