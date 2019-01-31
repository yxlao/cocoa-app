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

- (NSString *)strCat: (NSString *)one: (NSString *)two
{
    NSString *myString;
    myString = [NSString stringWithFormat:@"%@%@", one , two];
    return myString;
}

-(BOOL)application:(NSApplication *)sender openFile:(NSString *)filename
{
    // Redirect log for debugging
    int fd = creat("/Users/ylao/repo/cocoa-app/my_log.txt",
                   S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    close(STDERR_FILENO);
    dup(fd);
    close(fd);

    // Get full command
    NSString *open3d_viewer_path = @"/Users/ylao/repo/Open3D-Viewer/open3d-viewer";
    NSString *full_command = [NSString stringWithFormat:@"%@ %@", open3d_viewer_path, filename];
    NSLog(full_command);

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:[NSArray arrayWithObjects:@"-c", full_command, nil]];
    [task setStandardOutput:[NSPipe pipe]];
    [task setStandardInput:[NSPipe pipe]];
    [task launch];
    [task waitUntilExit];
    [task release];

    return YES;
}

@end
