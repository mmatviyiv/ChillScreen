//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import <Cocoa/Cocoa.h>


#define Log(f, ...) [Logger write:(f), ##__VA_ARGS__]


@interface Logger : NSObject
+ (void)write:(NSString *)format, ...;
@end
