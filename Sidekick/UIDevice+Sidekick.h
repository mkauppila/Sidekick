//  UIDevice+Sidekick.h
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

#import <UIKit/UIKit.h>

@interface UIDevice (Sidekick)

/**
 Determine if the device is iPhone.
 @return YES if the device is iPhone, otherwise NO
 */
- (BOOL)isiPhone;

/**
 Determine if the device is iPhone 5.
 @return YES if the device is iPhone 5, otherwise NO
 */
- (BOOL)isiPhone5;

/**
 Determine if the device is iPad.
 @return YES if the device is iPad, otherwise NO
 */
- (BOOL)isiPad;


/**
 Determine whether or not the device has retina display
 @return YES if it has retina, otherwise NO
 */
- (BOOL)hasRetinaDisplay;

/**
 Whether or not the device has 4 inch display. Note only
 use this if the device is iPhone.

 @return YES if it has retina, otherwise NO
 */
- (BOOL)hasFourInchDisplay;

@end
