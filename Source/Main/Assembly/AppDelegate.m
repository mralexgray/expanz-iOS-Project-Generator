////////////////////////////////////////////////////////////////////////////////
//
//  EXPANZ
//  Copyright 2008-2011 EXPANZ
//  All Rights Reserved.
//
//  NOTICE: Expanz permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

#import "AppDelegate.h"
#import "expanz_codegen_ui_MainWindowController.h"
#import "expanz_codegen_model_UserSession.h"
#import "JSObjection.h"
#import "expanz_CoreModule.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize windowController = _windowController;

/* ================================================ Interface Methods =============================================== */
- (void) applicationDidFinishLaunching:(NSNotification*)aNotification {
    NSConnection* connection = [[NSConnection alloc] init];
    [connection registerName:@"expanz.Model-Object-Explorer"];

    NSString* projectFilePath;
    NSArray* args = [[NSProcessInfo processInfo] arguments];
    for (NSString* arg in args) {
        if ([arg hasPrefix:@"-expanzProjectDirectory"]) {
            projectFilePath = [[[arg stringByReplacingOccurrencesOfString:@"-expanzProjectDirectory=" withString:@""]
                stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                stringByReplacingOccurrencesOfString:@"\"" withString:@""];

            LogDebug(@"Project file path is: %@", projectFilePath);
            [[UserSession sharedUserSession] setProjectFilePath:projectFilePath];
        }
    }

    JSObjectionInjector* injector = [JSObjection createInjector:[[CoreModule alloc] init]];
    [JSObjection setGlobalInjector:injector];

    _windowController = [[MainWindowController alloc] init];
    [_windowController showWindow:self];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender {
    return YES;
}

@end
