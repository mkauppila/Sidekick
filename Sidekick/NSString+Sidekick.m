//
//  NSString+Sidekick.m
//  Vesi
//
//  Created by markus on 20.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import "NSString+Sidekick.h"

#import "Functions.h"

@implementation NSString (Sidekick)

- (NSString *)asDirectoryPath
{
	return [DocumentsPath() stringByAppendingPathComponent:self];
}

- (NSString *)asBundlePath
{
	return [BundlePath() stringByAppendingPathComponent:self];
}


@end
