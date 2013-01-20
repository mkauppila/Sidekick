//
//  UIView+Sidekick.m
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "UIView+Sidekick.h"

@implementation UIView (Sidekick)

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
