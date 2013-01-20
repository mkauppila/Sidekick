//
//  Macros.h
//  Vesi
//
//  Created by markus on 20.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//


/** @title Debug macros */

// Copied from Cocoa Is My Girlfriend blog post
// (http://www.cimgf.com/2010/05/02/my-current-prefix-pch-file/)
// originally written by Marcus Zarra.

#ifdef DEBUG
	#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
	#define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
	#define DLog(...) do { } while (0)
	#define ALog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif

#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); }} while(0)

