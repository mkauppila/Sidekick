// ViewTest.m
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

#import <GHUnitIOS/GHUnit.h>

#import "UIView+Sidekick.h"

@interface ViewTest : GHTestCase {}
@property (assign, nonatomic) CGRect originalFrame;
@property (strong, nonatomic) UIView *testView;
@end

@implementation ViewTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)setUp
{
	self.originalFrame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
	self.testView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)tearDown 
{
	self.testView = nil;
}

- (void)testMoveFrameToLowRigth
{
	CGPoint movement = CGPointMake(20.0f, 20.0f);
	[self.testView moveFrameBy:movement];
	 
	GHAssertEquals(self.testView.frame.origin.x,
				   self.originalFrame.origin.x + movement.x,
				   @"should have moved on x-axis");

	GHAssertEquals(self.testView.frame.origin.y,
				   self.originalFrame.origin.y + movement.y,
				   @"should have moved on y-axis");
	
	GHAssertTrue(CGSizeEqualToSize(self.testView.frame.size,
								   self.originalFrame.size),
				 @"width & height should remain the same");
}

@end
