
#import <GHUnitIOS/GHUnit.h> 

#import "NSArray+Sidekick.h"

@interface ArrayTest : GHTestCase { }
@end

@implementation ArrayTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testFirstObject
{
	NSArray *array = @[@"first", @"second", @"third"];
	GHAssertEqualStrings([array firstObject], @"first", @"Should match the first item of array");
}

@end
