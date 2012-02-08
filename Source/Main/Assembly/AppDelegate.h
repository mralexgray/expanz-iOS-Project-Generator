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

#import <Cocoa/Cocoa.h>

@class expanz_codegen_ui_ModelObjectExplorerViewController;

@interface AppDelegate : NSObject<NSApplicationDelegate> {

@private
    expanz_codegen_ui_ModelObjectExplorerViewController* _explorerController;
}

@property(nonatomic, strong) NSWindow* window;


@end