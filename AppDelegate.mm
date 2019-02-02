#import "AppDelegate.h"
#import "external.h"
#import "string"

@implementation AppDelegate

@synthesize window = _windows;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename {
    // Redirect log for debugging
    int fd = creat("/Users/ylao/repo/cocoa-app/log.txt",
                   S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    close(STDERR_FILENO);
    dup(fd);
    close(fd);

    // Get full command
    NSString *resource_path = [[NSBundle mainBundle] resourcePath];
    NSString *open3d_viewer_path = [NSString
            stringWithFormat:@"%@/%@", resource_path, @"open3d-viewer-bin"];

    // [NSString stringWithFormat:@"%@ %@", open3d_viewer_path, filename];
    // https://stackoverflow.com/questions/8001677/how-do-i-convert-a-nsstring-into-a-stdstring
    // https://stackoverflow.com/questions/3552195/how-to-convert-stdstring-to-nsstring
    std::string full_command_std = concat_string(std::string([open3d_viewer_path UTF8String]),
                                                 std::string(" "));
    full_command_std = concat_string(full_command_std, std::string([filename UTF8String]));
    NSString *full_command = [NSString stringWithCString:full_command_std.c_str()
                              encoding:[NSString defaultCStringEncoding]];
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
