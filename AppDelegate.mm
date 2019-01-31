#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _windows;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSAppleEventManager *em = [NSAppleEventManager sharedAppleEventManager];
    [em
    setEventHandler:self
    andSelector:@selector(getUrl:withReplyEvent:)
    forEventClass:kInternetEventClass
    andEventID:kAEGetURL];
}

- (void)getUrl:(NSAppleEventDescriptor *)event
    withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
    // Get the URL
    NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject]
        stringValue];

    // TODO: Your custom URL handling code here
}

@end
