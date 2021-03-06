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


#import "expanz_model_AbstractGridDataCell.h"


@implementation expanz_model_AbstractGridDataCell

@synthesize cellId = _cellId;

/* ================================================== Initializers ================================================== */
- (id) initWithCellId:(NSString*)cellId {
    self = [super init];
    if (self) {
        _cellId = [cellId copy];
    }
    return self;

}

@end