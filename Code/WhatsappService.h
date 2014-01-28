/* Copyright 2012 IGN Entertainment, Inc. */

#import <Foundation/Foundation.h>
#import "ShareThis.h"

extern NSString *const LineActivity;

@interface LineService : NSObject <STService>

+(BOOL)isLineInstalled;

@end
