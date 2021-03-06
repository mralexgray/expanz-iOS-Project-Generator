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

#import "expanz_service_CreateActivityRequest.h"
#import "expanz_service_DataPublicationRequest.h"

@implementation expanz_service_CreateActivityRequest

@synthesize activityName = _activityName;
@synthesize style = _style;
@synthesize initialKey = _initialKey;
@synthesize sessionToken = _sessionToken;

/* ================================================== Initializers ================================================== */
- (id) init {
    self = [super init];
    if (self) {
        _dataPublicationRequests = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id) initWithActivityName:(NSString*)activityName style:(ActivityStyle*)style initialKey:(NSString*)initialKey
               sessionToken:(NSString*)sessionToken {
    self = [self init];
    _activityName = [activityName copy];
    _style = style;
    _initialKey = [initialKey copy];
    _sessionToken = [sessionToken copy];
    return self;
}


/* ================================================ Interface Methods =============================================== */
- (NSArray*) dataPublicationRequests {
    return [_dataPublicationRequests allValues];
}

- (DataPublicationRequest*) dataPublicationRequestFor:(NSValue*)key {
    DataPublicationRequest* publicationRequest = [_dataPublicationRequests objectForKey:key];
    if (publicationRequest == nil) {
        publicationRequest = [[DataPublicationRequest alloc] init];
        [_dataPublicationRequests setObject:publicationRequest forKey:key];
    }
    return publicationRequest;
}

- (NSValue*) keyForDataPublicationRequest:(DataPublicationRequest*)publicationRequest {
    return [[_dataPublicationRequests allKeysForObject:publicationRequest] objectAtIndex:0];
}


/* ================================================= Protocol Methods =============================================== */
#pragma mark xml_Serializable

#define kXmlTempate @"<ExecX xmlns=\"http://www.expanz.com/ESAService\"><xml><ESA><CreateActivity name=\"%@\" \
style=\"%@\" %@>%@</CreateActivity></ESA></xml><sessionHandle>%@</sessionHandle></ExecX>"

- (NSString*) toXml {
    NSString* initialKeyAttribute =
        _initialKey != nil ? [NSString stringWithFormat:@"initialKey=\"%@\"", _initialKey] : @"";

    NSMutableString* body = [[NSMutableString alloc] initWithString:@""];
    for (DataPublicationRequest* dataPublicationRequest in [_dataPublicationRequests allValues]) {
        [body appendString:[dataPublicationRequest toXml]];
    }
    return [NSString stringWithFormat:kXmlTempate, _activityName, [_style name], initialKeyAttribute, body,
                                      _sessionToken];
}

@end
