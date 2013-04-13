//
//  NSDate+Sidekick.m
//  Vesi
//
//  Created by markus on 26.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "NSDate+Sidekick.h"

@implementation NSDate (Sidekick)

- (NSDate *)dateAsMidnight {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	NSUInteger componentFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *components = [calendar components:componentFlags
											   fromDate:self];
	return [calendar dateFromComponents:components];
}

@end