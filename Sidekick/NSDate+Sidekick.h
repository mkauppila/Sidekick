//
//  NSDate+Sidekick.h
//  Vesi
//
//  Created by markus on 26.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Sidekick)

+ (NSDate *)dateFromHttpDate:(NSString *)dateString;

- (NSDate *)dateAsMidnight;

/**
 
 
 @discussion Uses autoUpdatingCalendar, don't cache the result.
 */
- (BOOL)isSameDay:(NSDate *)date;

@end
