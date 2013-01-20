//
//  UIView+Sidekick.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 TODO:
	- Add more convenient setters
 */

@interface UIView (Sidekick)

/**
 Sets the new origin Y value for the v
 */
- (void)setOriginY:(CGFloat)newOriginY;

/**
 Sets the height of the view.
 @param newHeight new height of the view
 */
- (void)setHeight:(CGFloat)newHeight;

@end
