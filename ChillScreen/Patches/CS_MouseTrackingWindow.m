//    Created by Mark Matviiv on 20.12.2019.
//    Copyright © 2019 Mark Matviiv. MIT License.

#import "CS_MouseTrackingWindow.h"


@implementation CS_MouseTrackingWindow

+ (void)load {
    [self patch];
}

- (id)CS_initWithContentRect:(NSRect)rect styleMask:(NSWindowStyleMask)mask backing:(NSBackingStoreType)back defer:(BOOL)defer {
    #ifdef DEBUG
        Log(@"CS_initWithContentRect: %@ %d %d %d", NSStringFromRect(rect), mask, back, defer);
    #endif
    
    id window = [self CS_initWithContentRect:rect styleMask:mask backing:back defer:defer];
    
    NSButton *closeButton = [window standardWindowButton:NSWindowCloseButton];
    NSView *titleBarView = closeButton.superview;
    NSTextField *title = [titleBarView subviews].lastObject;
    
    NSTextField *label = [NSTextField labelWithString:@"[Chilled]"];
    [label setToolTip:[NSString stringWithFormat:@"ChillScreen enabled: %@", CHILLSCREEN_VERSION]];
    [label setTextColor:title.textColor];
    [label setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    [titleBarView addSubview:label];
    
    CGPoint offset = closeButton.frame.origin;
    [label.rightAnchor constraintEqualToAnchor:titleBarView.rightAnchor constant:-(offset.x)].active = YES;
    [label.topAnchor constraintEqualToAnchor:titleBarView.topAnchor constant:offset.y].active = YES;
    
    return window;
}

@end
