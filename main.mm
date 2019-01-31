#import <AppKit/NSApplication.h> // NSApplicationMain

int main(int argc, const char *argv[]) {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:[NSArray arrayWithObjects:@"/Users/ylao/repo/playground/write_hello_file.sh", nil]];
    [task setStandardOutput:[NSPipe pipe]];
    [task setStandardInput:[NSPipe pipe]];
    [task launch];
    [task release];
    return 0;
    // return NSApplicationMain(argc, argv);
}
