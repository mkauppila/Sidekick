//  NSDate+Sidekick.h
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
