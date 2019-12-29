//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "Log.h"


@implementation Logger

+ (void)write:(NSString *)format, ... {
    va_list arguments;
    
    va_start(arguments, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);

    NSLog(@"[ChillScreen] [%@]: %@", CHILLSCREEN_VERSION, message);
}

@end
