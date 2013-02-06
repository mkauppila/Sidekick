//
//  Functions.m
//  Vesi
//
//  Created by markus on 30.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "Functions.h"

BOOL IS_IPHONE(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone; }
BOOL IS_IPAD(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad; }

BOOL HAS_RETINA_DISPLAY(void) { return [[UIScreen mainScreen] scale] == 2.0f; }

UIImage *ImageNamed(NSString *name) { return [UIImage imageNamed:name]; }

BOOL FloatEqualsZero(float value) { return fabsf(value) < FLT_EPSILON; }
BOOL FloatEqualsFloat(float left, float right) { return fabsf(left-right) < FLT_EPSILON; }

NSString *CGRectToString(CGRect rect) { return NSStringFromCGRect(rect); }
NSString *CGPointToString(CGPoint point) { return NSStringFromCGPoint(point); }
NSString *CGSizeToString(CGSize size) { return NSStringFromCGSize(size); }

NSString *BoolToString(BOOL value) { return value ? @"YES" : @"NO"; }
