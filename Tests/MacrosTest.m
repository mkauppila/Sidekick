#import <GHUnitIOS/GHUnit.h> 

#import "Macros.h"

@interface MacrosTest : GHTestCase { }
@end

@implementation MacrosTest

- (BOOL)shouldRunOnMainThread { return NO; }

- (void)testClampingPositiveIntegers
{
	GHAssertTrue(clamp(5, 0, 10)  == 5, nil);
	GHAssertTrue(clamp(15, 0, 10) == 10, nil);
	GHAssertTrue(clamp(-5, 0, 10) == 0, nil);

	GHAssertTrue(clamp(-5, -10, 0)  == -5, nil);
	GHAssertTrue(clamp(15, -10, 0) == 0, nil);
	GHAssertTrue(clamp(-5, 0, 10) == 0, nil);
	
	GHAssertTrue(clamp(0, -5, 10) == 0, nil);
	GHAssertTrue(clamp(-10, -5, 10) == -5, nil);
	GHAssertTrue(clamp(15, -5, 10) == 10, nil);

	// Add stranger border cases
}

- (void)testClampingFloats
{
	GHAssertTrue(clamp(0.5f, 0.0f, 1.0f) == 0.5f, nil);
	GHAssertTrue(clamp(-1.0f, 0.0f, 1.0f) == 0.0f, nil);
	GHAssertTrue(clamp(2.0f, 0.0f, 1.0f) == 1.0f, nil);
	
	// Add more basic and some stranger border cases
}

@end
