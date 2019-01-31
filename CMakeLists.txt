cmake_minimum_required(VERSION 2.8.8)
project(open3d-viewer)

add_executable(
    open3d-viewer
    MACOSX_BUNDLE
    AppDelegate.h
    AppDelegate.mm
    # file_handler.mm
    main.mm
    MainMenu.xib
)

set_source_files_properties(
    MainMenu.xib
    PROPERTIES
    MACOSX_PACKAGE_LOCATION
    Resources
)

set_target_properties(
    open3d-viewer
    PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST
    ${CMAKE_CURRENT_LIST_DIR}/plist.in
)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -framework AppKit")
