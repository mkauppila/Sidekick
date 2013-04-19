#import <GHUnitIOS/GHUnit.h> 

#import "NSString+Sidekick.h"

@interface StringTest : GHTestCase { }
@end

@implementation StringTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testDocumentsPath
{
	NSString *directory = [@"filename" asDocumentsPath];
	NSString *const correctResult = @"/Documents/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated documents path is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testLibraryPath
{
	NSString *directory = [@"filename" asLibraryPath];
	NSString *const correctResult = @"/Library/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated library path is incorrect. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testBundlePath
{
	NSString *directory = [@"filename" asBundlePath];
	NSString *const correctResult = @".app/filename";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated bundle path is incorrect. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testDocumentsPathWithExtension
{
	NSString *directory = [@"filename" asDocumentsPathWithExtension:@"png"];
	NSString *const correctResult = @"/Documents/filename.png";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated documents path with extension is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

- (void)testLibraryPathWithExtension
{
	NSString *directory = [@"filename" asLibraryPathWithExtension:@"png"];
	NSString *const correctResult = @"/Library/filename.png";
	GHAssertTrue([directory hasSuffix:correctResult],
				 @"Generated library path with extension is in correct. Got %@, expected string with suffix: %@",
				 directory, correctResult);
}

@end
