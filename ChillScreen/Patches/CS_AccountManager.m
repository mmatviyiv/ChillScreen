//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "CS_AccountManager.h"


@implementation CS_AccountManager

+ (void)load {
    [self patch];
}

- (void)CS__connectionError:(NSError *)error didChangeForAccount:(id)account {
    #ifdef DEBUG
        Log(@"CS__connectionError: %@ %@", error, account);
    #endif

    if(error) {
        Log(@"skipping %@", error);
        return;
    }

    [self CS__connectionError:error didChangeForAccount:account];
}

@end
