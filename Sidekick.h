//
//  Sidekick.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "Macros.h"
#import "Functions.h"

/**
 TODO
	- clampf(value, min, max)  /OK
		- clampf(2.3, 0.0, 1.0) -> 1.0
 
	- box/unbox cgrect 
	- ImageNamed(@"blaablaa") -> UIImage of blaa laa (calls [UIImage /OK
	- imageNamed:@"blaablaa"]) // crappy name
	 
	- HAS_RETINA_DISPLAY? /OK
	 
	- IS_IPAD /OK
	- IS_IPHONE /OK
	
	- dispatchToMainQueue(BOOL async, block)
	- dispatchToBackgroundQueue(<same as above)
	- isMainQueue() -> BOOL
	- isMainThread();
 
 
 as isSameDate:(NSDate *) category to it

 
 Refer to some RFC in the documentation (look this for those:
 http://stackoverflow.com/questions/6253044/how-to-properly-convert-last-modified-string-from-a-http-response-to-a-nsdate-on)
 
 NSString *dateString = response.allHeaderFields[@"Date"];
 NSDateFormatter *df = [[NSDateFormatter alloc] init];
 //df.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
 df.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
 df.locale = [[NSLocale alloc]
 initWithLocaleIdentifier:@"en_US_POSIX"];
 df.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
 NSDate *date = [df dateFromString:dateString];
 DLog(@"date string: %@", [df stringFromDate:date]);
 */


/**
 Foreword the README?
 
 There's a bunch of good libraries for iOS. Most of the time I only end
 up using a couple of methods of a what a certain libray offers. I
 created this so I don't have to add hundreds of classess and fiels to
 project that I don't need so I could get method that I really need. So
 this makes my life easier on the long run.
 
 (some thing along those lines).
 */

// Categories
#import "UIColor+Sidekick.h"

