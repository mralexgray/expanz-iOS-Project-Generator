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

#import <Foundation/Foundation.h>
#import "expanz_model_ActivitySchema.h"

@interface expanz_codegen_model_ActivityGenerator : NSObject {

@private
    NSString* _headerTemplate;
    NSString* _implTemplate;
    NSString* _xibTemplate;
}

@property(nonatomic, strong, readonly) ActivitySchema* schema;


- (id) initWithSchema:(ActivitySchema*)schema headerTemplate:(NSString*)headerTemplate
        implTemplate:(NSString*)implTemplate xibTemplate:(NSString*)xibTemplate;


- (NSString*) headerText;

- (NSString*) implText;

@end
/* ================================================================================================================== */
@compatibility_alias ActivityGenerator expanz_codegen_model_ActivityGenerator;