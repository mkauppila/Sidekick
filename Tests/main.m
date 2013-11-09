//
//  main.m
//  Sidekick
//
//  Created by markus on 13.4.2013.
//  Copyright (c) 2013 Markus Kauppila. All rights reserved.
//

#import <UIKit/UIKit.h>


int main(int argc, char *argv[])
{
	@autoreleasepool {
		int retVal = 0;
		if (getenv("GHUNIT_CLI")) {
			retVal = [GHTestRunner run];
		} else {
			retVal = UIApplicationMain(argc, argv, nil, @"GHUnitIOSAppDelegate");
		}
		return retVal;
	}
}
