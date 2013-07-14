//  Functions.m
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
#import "Functions.h"

#import "NSString+Sidekick.h"

#pragma mark - Device support

BOOL IS_IPHONE(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone; }
BOOL IS_IPHONE5(void) { return IS_IPHONE() && [UIScreen mainScreen].bounds.size.height == 568.0f; }
BOOL IS_IPAD(void) { return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad; }

BOOL HAS_RETINA_DISPLAY(void) { return [[UIScreen mainScreen] scale] == 2.0f; }
BOOL HAS_FOUR_INCH_DISPLAY(void) { return [UIScreen mainScreen].bounds.size.height == 568.0f; }

#pragma mark - Shorthands for paths

NSString *DocumentsPath(void)
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *LibraryPath(void)
{
	return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *BundlePath(void) { return [[NSBundle mainBundle] bundlePath]; }

#pragma mark - Image helpers

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

#pragma Floating-point helpers

BOOL FloatEqualsZero(float value) { return fabsf(value) < FLT_EPSILON; }
BOOL FloatEqualsFloat(float left, float right) { return fabsf(left-right) < FLT_EPSILON; }

#pragma mark - Stringify

NSString *CGRectToString(CGRect rect) { return NSStringFromCGRect(rect); }
NSString *CGPointToString(CGPoint point) { return NSStringFromCGPoint(point); }
NSString *CGSizeToString(CGSize size) { return NSStringFromCGSize(size); }

NSString *BoolToString(BOOL value) { return value ? @"YES" : @"NO"; }

#pragma mark - Threading

void DispatchToMainThread(bool async, dispatch_block_t block) {
	// If already running in main thread, just execute the block to prevent
	// deadlocking
	if ([NSThread mainThread]) {
		block();
	} else {
		if (async) {
			dispatch_async(dispatch_get_main_queue(), block);
		} else {
			dispatch_sync(dispatch_get_main_queue(), block);
		}
	}
}

void DispatchToBackgroundThread(bool async, dispatch_block_t block) {
	dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
	if (async) {
		dispatch_async(backgroundQueue, block);
	} else {
		dispatch_sync(backgroundQueue, block);
	}
}
