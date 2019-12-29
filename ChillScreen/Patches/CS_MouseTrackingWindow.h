//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "Patcher.h"


@interface CS_MouseTrackingWindow : Patcher

@end

@interface CS_MouseTrackingWindow (NoImplementation)
- (NSButton *)standardWindowButton:(NSWindowButton)b;
@end
