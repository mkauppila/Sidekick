//
//  NSArray+Sidekick.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sidekick)

/**
 Returns the object from the array with lowest index value.
 
 @return first object of the array or nil on failure
 */
- (id)firstObject;

@end
