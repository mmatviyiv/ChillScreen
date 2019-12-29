//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "JRLPSwizzle.h"
#import "Log.h"


@interface Patcher : NSObject
+ (void)patch;
@end
