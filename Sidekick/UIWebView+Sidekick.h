//
//  UIWebView+Sidekick.h
//  Sidekick
//
//  Created by markus on 13.8.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Sidekick)

/**
 Show or hide thes scroll shadows from `UIWebView`.
 @param showShadows Whether or not the shadows should be shown
 */
- (void)shouldShowShadows:(BOOL)showShadows;

@end
