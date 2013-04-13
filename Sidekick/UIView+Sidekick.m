//
//  UIView+Sidekick.m
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "UIView+Sidekick.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (Sidekick)

- (UIImage *)snapshot
{
	CGRect rect = [self bounds];
	// Set scaling to native
	UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[self.layer renderInContext:context];
	UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return snapshotImage;
}

- (void)setOriginY:(CGFloat)newOriginY
{
	
}


- (void)setHeight:(CGFloat)newHeight
{
	CGRect frame = self.frame;
	frame.size.height = newHeight;
	self.frame = frame;
}

@end
