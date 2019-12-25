//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "ChillScreenPlugin.h"


@implementation ChillScreenPlugin

+ (void)load {
    Class accountManagerClass = NSClassFromString(@"AccountManager");
    Class chillScreenPluginClass = NSClassFromString(@"ChillScreenPlugin");
    
    SEL originalSel = NSSelectorFromString(@"_connectionError:didChangeForAccount:");
    SEL swizzledSel = NSSelectorFromString(@"swizzleConnectionError:didChangeForAccount:");
    
    [accountManagerClass jrlp_addMethod:swizzledSel fromClass:chillScreenPluginClass error:nil];
    [accountManagerClass jrlp_swizzleMethod:originalSel withMethod:swizzledSel error:nil];
    
    Log(@"swizzled methods");
}

+ (void)initialize {
    Log(@"loading started");
    
    Class mVMailBundleClass = NSClassFromString(@"MVMailBundle");
    
    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wdeprecated"
    class_setSuperclass(self, mVMailBundleClass);
    #pragma GCC diagnostic pop
    
    [[self class] registerBundle];
    
    Log(@"plugin registered");
}

- (void)swizzleConnectionError:(id)error didChangeForAccount:(id)account {
    #ifdef DEBUG
        Log(@"%@ %@", error, account);
    #endif
    
    if(error) {
        Log(@"skipping error %@", error);
        
        return;
    }
    
    [self swizzleConnectionError:error didChangeForAccount:account];
}

@end
