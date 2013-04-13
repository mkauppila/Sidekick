//
//  Functions.m
//  Vesi
//
//  Created by markus on 30.1.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "Functions.h"

BOOL IS_IPHONE(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone; }
BOOL IS_IPHONE5(void) { return IS_IPHONE() && [UIScreen mainScreen]. bounds.size.height == 568.0f; }
BOOL IS_IPAD(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad; }

BOOL HAS_RETINA_DISPLAY(void) { return [[UIScreen mainScreen] scale] == 2.0f; }

NSString *DocumentsPath(void)
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *LibraryPath(void)
{
	return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *BundlePath(void) { return [[NSBundle mainBundle] bundlePath]; }


UIImage *ImageNamedCached(NSString *name) { return [UIImage imageNamed:name]; }

UIImage *ImageNamed(NSString *name)
{
	NSCParameterAssert(name);

	// ask for file extions
	// rip it out, check if retina display -> add @2x
	// put the file extions back
	// if retina version exists, load it
	// otherwise load non-retina version
	NSString *pathExtension = [[name pathExtension] isEqualToString:@""] ? @"png" : [name pathExtension];
	NSString *filename = [name stringByDeletingPathExtension];
	NSString *path = @"";
	UIImage *loadedImage = nil;
	
	NSString *fullRetinaPath = [[NSString stringWithFormat:@"%@%@.%@", filename, @"@2x", path] asBundlePath];
	BOOL retinaVersionExists = [[NSFileManager defaultManager] fileExistsAtPath:fullRetinaPath];
	if (HAS_RETINA_DISPLAY() && retinaVersionExists) {
		loadedImage = [UIImage imageWithContentsOfFile:fullRetinaPath];
	}
	
	if (loadedImage == nil) {
		NSString *imagePath = [[NSString stringWithFormat:@"%@.%@", filename, pathExtension] asBundlePath];
		loadedImage = [UIImage imageWithContentsOfFile:imagePath];
	}
	
	return loadedImage;

#if 0 // basic version withou retina support
	BOOL noPathExtension = [[name pathExtension] isEqualToString:@""];
	if (noPathExtension) {
		if (HAS_RETINA_DISPLAY()) {
			name = [name stringByAppendingFormat:@"@2x.png"];
			BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[name asBundlePath]];
			if (fileExists) {
				// load file
			}
		}
	}
	DLog(@"-name: %@", name);
	UIImage *loadedImage = [UIImage imageWithContentsOfFile:[name asBundlePath]];

	NSCAssert(loadedImage, @"Loaded image shouldn't be nil at this point");
	return loadedImage;
#endif
}


BOOL FloatEqualsZero(float value) { return fabsf(value) < FLT_EPSILON; }
BOOL FloatEqualsFloat(float left, float right) { return fabsf(left-right) < FLT_EPSILON; }

NSString *CGRectToString(CGRect rect) { return NSStringFromCGRect(rect); }
NSString *CGPointToString(CGPoint point) { return NSStringFromCGPoint(point); }
NSString *CGSizeToString(CGSize size) { return NSStringFromCGSize(size); }

NSString *BoolToString(BOOL value) { return value ? @"YES" : @"NO"; }
