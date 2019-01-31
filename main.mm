#import <AppKit/NSApplication.h> // NSApplicationMain

int main(int argc, const char *argv[]) {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:[NSArray arrayWithObjects:@"-c", @"/Users/ylao/repo/Open3D-Viewer/open3d-viewer /Users/ylao/repo/Open3D/examples/TestData/knot.ply", nil]];
    [task setStandardOutput:[NSPipe pipe]];
    [task setStandardInput:[NSPipe pipe]];

    [task launch];
    [task waitUntilExit];
    [task release];
    return 0;
    // return NSApplicationMain(argc, argv);
}
