//
//  NSString+Sidekick.h
//  Vesi
//
//  Created by markus on 20.3.2013.
//  Copyright (c) 2013 markus.kauppila. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sidekick)

- (NSString *)asDocumentsPath;
- (NSString *)asLibraryPath;
- (NSString *)asBundlePath;

- (NSString *)asDocumentsPathWithExtension:(NSString *)extension;
- (NSString *)asLibraryPathWithExtension:(NSString *)extension;

@end
