//  Functions.h
//
// Copyright (c) 2013 Markus Kauppila <markus.kauppila@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to  use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
