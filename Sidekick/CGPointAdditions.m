// CGPointAdditions.m
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

#import "CGPointAdditions.h"

CGPoint CGPointAdd(CGPoint p1, CGPoint p2)
{
	return CGPointMake(p1.x + p2.x,
					   p1.y + p2.y);
}

CGPoint CGPointSubtract(CGPoint p1, CGPoint p2)
{
	return CGPointMake(p1.x - p2.x,
					   p1.y - p2.y);
}

CGPoint CGPointDivide(CGPoint point, CGFloat divider)
{
	return CGPointMake(point.x / divider, point.y / divider);
}

CGPoint CGPointMultiply(CGPoint point, CGFloat multiplier)
{
	return CGPointMake(point.x * multiplier, point.y * multiplier);
}
/**
 Length of CGPoint when it represents a vector
 */
CGFloat CGPointLength(CGPoint p)
{
	return sqrtf(p.x * p.x + p.y * p.y);
}

