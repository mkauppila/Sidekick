//  UIColor+Sidekick.h
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

@interface UIColor (Sidekick)

/**
 Creates UIColor from the given hex string. The hex string can be in the 
 following formats: #RRGGBBAA or #RRGGBB. The # can be omitted if needed.
 
 @param hex representation of the color
 @return Created UIColor
 */
+ (UIColor *)colorWithHex:(NSString *)hexString;

/**
 Create color from RGB integers.

 @param red Red component of color in range [0, 255]
 @param green Green component of color in range [0, 255]
 @param blue Blue component of color in range [0, 255]
 @return The specified color
 */
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red
					green:(NSUInteger)green
					 blue:(NSUInteger)blue;

/**
 Create color from RGBA integers.
 
 @param red Red component of color in range [0, 255] 
 @param green Green component of color in range [0, 255] 
 @param blue Blue component of color in range [0, 255] 
 @param alpha Alpha component of color in range [0, 255]
 @return The specified color
 */
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red
					green:(NSUInteger)green
					 blue:(NSUInteger)blue
					alpha:(NSUInteger)alpha;


@end
