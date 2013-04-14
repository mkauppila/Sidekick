//
//  Functions.h
//  Vesi
//
//  Created by markus on 30.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL IS_IPHONE(void);
BOOL IS_IPHONE5(void);
BOOL IS_IPAD(void);

BOOL HAS_RETINA_DISPLAY(void);

NSString *DocumentsPath(void);
NSString *LibraryPath(void);
NSString *BundlePath(void);

// Used `UIImage imageNamed:` which internally caches the result
UIImage *ImageNamedCached(NSString *name);

// Directly reads the image from bundle without caching
// TODO: Appends png automatically and tries to load @2x with using
// retina screen. If file extension is specified (@"plaa.jpg"), dont append
// png but use the original. Should function like `ImageNamedCached` but no
// caching
UIImage *ImageNamed(NSString *name);

// Add double counterpart (long double would be uselesS)
BOOL FloatEqualsZero(float value);
BOOL FloatEqualsFloat(float left, float right);

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

void DispatchToMainThread(bool async, dispatch_block_t block);
void DispatchToBackgroundThread(bool async, dispatch_block_t block);
