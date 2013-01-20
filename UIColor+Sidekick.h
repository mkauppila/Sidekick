//
//  UIColor+Sidekick.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Sidekick)

/**
 Creates UIColor from the given hex string. The hex string needs to
 be in "#RRGGBBAA" format.
 
 @param hex representation of the color
 @return Created UIColor
 */
+ (UIColor *)colorWithHex:(NSString *)hexString;

@end
