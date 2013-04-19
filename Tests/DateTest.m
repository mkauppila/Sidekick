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
