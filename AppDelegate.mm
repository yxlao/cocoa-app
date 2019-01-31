#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _windows;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // NSAppleEventManager *em = [NSAppleEventManager sharedAppleEventManager];
    // [em
    // setEventHandler:self
    // andSelector:@selector(getUrl:withReplyEvent:)
    // forEventClass:kInternetEventClass
    // andEventID:kAEGetURL];
}

// - (void)getUrl:(NSAppleEventDescriptor *)event
//     withReplyEvent:(NSAppleEventDescriptor *)replyEvent
// {
//     // Get the URL
//     NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject]
//         stringValue];

//     // TODO: Your custom URL handling code here
// }

-(BOOL)application:(NSApplication *)sender openFile:(NSString *)filename
{
    int fd = creat("/Users/ylao/repo/cocoa-app/my_log.txt",
                       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    close(STDERR_FILENO);
    dup(fd);
    close(fd);
    NSLog(@"this will be written to my_log");
    NSLog(@"%@", filename);
    return YES;
}

@end
