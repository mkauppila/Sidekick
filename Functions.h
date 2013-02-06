//
//  Functions.h
//  Vesi
//
//  Created by markus on 30.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL IS_IPHONE(void);
BOOL IS_IPAD(void);

BOOL HAS_RETINA_DISPLAY(void);

UIImage *ImageNamed(NSString *name);

BOOL FloatEqualsZero(float value);

/**
 @name Stringiy CoreGraphics structures

 These are basically just short hands for NSStringFrom{Rect,Point,Size} functions
 but provide nice symmetry with CG{Rect,Point,Size}FromString functions

 CRect rect = CGRectZero;
 CGRect newRect = CGRectFromString(CGRectToString(rect))
 CGRectEqualToRecT(rect, newRect) -> YES
 
 This applies to all these functions
*/

NSString *CGRectToString(CGRect rect);
NSString *CGPointToString(CGPoint point);
NSString *CGSizeToString(CGSize size);


NSString *BoolToString(BOOL value);
