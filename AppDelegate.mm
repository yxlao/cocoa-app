#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _windows;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename {
    // Redirect log for debugging
    int fd = creat("/Users/ylao/repo/cocoa-app/my_log.txt",
                   S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    close(STDERR_FILENO);
    dup(fd);
    close(fd);

    // Get full command
    NSString *resource_path = [[NSBundle mainBundle] resourcePath];
    NSString *open3d_viewer_path = [NSString
            stringWithFormat:@"%@/%@", resource_path, @"open3d-viewer-bin"];
    NSString *full_command =
            [NSString stringWithFormat:@"%@ %@", open3d_viewer_path, filename];
    // NSLog(@"%@", full_command);

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:[NSArray arrayWithObjects:@"-c", full_command, nil]];
    [task setStandardOutput:[NSPipe pipe]];
    [task setStandardInput:[NSPipe pipe]];
    [task launch];
    [task waitUntilExit];
    [task release];

    // Terminate app: https://stackoverflow.com/a/25259343/1255535
    [[NSApplication sharedApplication] terminate:self];
    return YES;
}

@end
