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
 Sidekick requires QuartzCore Framework.
 
 TODO
	- box/unbox cgrect
 
 as isSameDate:(NSDate *) category to it /OK
	tomorrow /why?
	yesterdayc /why?
	midnight functions /
 
Add LibraryPath (useful as explained in link below): /OK
	http://developer.apple.com/library/ios/#qa/qa1699/_index.html

 
// https://gist.github.com/mpospese/5053969 
 // Add stuff from that gist, give credit where credit is due.
 // http://markpospesel.wordpress.com/2013/02/27/cgrectintegral/?utm_source=iOS+Dev+Weekly&utm_campaign=ca8aa0f371-iOS_Dev_Weekly_Issue_83&utm_medium=email
 
 
 ADD SAssert() same as c assert (no need to give string to it)

 
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


// Categories
#import "UIColor+Sidekick.h"
#import "UIView+Sidekick.h"
#import "NSArray+Sidekick.h"
#import "NSString+Sidekick.h"
#import "NSDate+Sidekick.h"

