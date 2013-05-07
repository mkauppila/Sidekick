//
//  UIView+Sidekick.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Sidekick)

/**
 Takes snapshot of the view (including all the subviews)
 @return The snapshot as `UIImage` or `nil` on failure.
 */
- (UIImage *)snapshot;

@end
