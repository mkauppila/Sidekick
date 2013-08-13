//
//  UIWebView+Sidekick.m
//  Sidekick
//
//  Created by markus on 13.8.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import "UIWebView+Sidekick.h"

@implementation UIWebView (Sidekick)

- (void)shouldShowShadows:(BOOL)showShadows
{
	for (UIView *shadowView in [self.scrollView subviews])
	{
		if ([shadowView isKindOfClass:[UIImageView class]]) {
			[shadowView setHidden:YES];
		}
	}
}

@end
