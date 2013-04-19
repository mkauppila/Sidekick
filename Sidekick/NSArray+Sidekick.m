//
//  NSArray+Sidekick.m
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "NSArray+Sidekick.h"

@implementation NSArray (Sidekick)

- (id)firstObject
{
	id object = nil;
	if (self.count > 0) {
		object = [self objectAtIndex:0];
	}
	return object;
}

@end
