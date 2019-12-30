//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "ChillScreenPlugin.h"


@implementation ChillScreenPlugin

+ (void)load {
    Log(@"patching components");
}

+ (void)initialize {
    Log(@"loading plugin");
    
    Class mVMailBundleClass = NSClassFromString(@"MVMailBundle");
    
    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wdeprecated"
    class_setSuperclass(self, mVMailBundleClass);
    #pragma GCC diagnostic pop
    
    [[self class] registerBundle];
    
    Log(@"plugin registered");
}

@end
