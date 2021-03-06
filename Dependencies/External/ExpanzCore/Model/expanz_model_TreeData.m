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

#import "expanz_model_TreeData.h"
#import "expanz_model_Folder.h"

@implementation expanz_model_TreeData

/* ================================================== Initializers ================================================== */
- (id)initWithDataId:(NSString*)dataId {
    self = [super initWithDataId:dataId];
    if (self) {
        _folders = [[NSMutableArray alloc] init];
    }
    return self;
}


/* ================================================ Interface Methods =============================================== */
- (NSArray*)folders {
    NSSortDescriptor* sorter = [NSSortDescriptor sortDescriptorWithKey:@"sequence" ascending:YES];
    return [_folders sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorter]];
}

- (Folder*) folderWithId:(NSString*)folderId {

    for (Folder* folder in _folders) {
        if ([[folder folderId] isEqualToString:folderId]) {
            return folder;
        }
    }
    return nil;
}


- (void)addFolder:(expanz_model_Folder*)folder {
    [_folders addObject:folder];
}

/* ================================================================================================================== */
#pragma mark AbstractData Template Methods

- (int) count {
    return [_folders count];
}



@end