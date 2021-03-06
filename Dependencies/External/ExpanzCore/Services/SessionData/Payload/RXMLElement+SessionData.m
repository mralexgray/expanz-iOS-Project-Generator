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

#import "RXMLElement+SessionData.h"
#import "expanz_model_menuItem.h"
#import "expanz_model_Menu.h"
#import "expanz_model_ProcessArea.h"
#import "expanz_model_UserRole.h"
#import "expanz_model_SessionData.h"

@implementation RXMLElement (SessionData)


/* ================================================ Interface Methods =============================================== */
- (expanz_model_SessionData*) asSessionData {
    if (![self.tag isEqualToString:@"ESA"]) {
        [NSException raise:NSInvalidArgumentException format:@"Element is not ESA."];
    }

    NSString* operationalMode = [self attribute:@"operationalMode"];
    NSString* timeZone = [self attribute:@"timeZone"];
    NSString* blobCacheUrl = [self attribute:@"blobCacheURL"];
    NSString* userCultureName = [self attribute:@"UserCultureName"];
    Menu* menu = [[self child:@"Menu"] asMenu];

    return [[SessionData alloc]
            initWithOperationalMode:operationalMode timeZone:timeZone blobCacheUrl:blobCacheUrl
            userCultureName:userCultureName menu:menu];
}


- (Menu*) asMenu {
    if (![self.tag isEqualToString:@"Menu"]) {
        [NSException raise:NSInvalidArgumentException format:@"Element is not a Menu."];
    }

    BOOL hasWorkFlowTrays = [[self attribute:@"hasWorkflowTrays"] boolValue];
    BOOL canChangeCompanyRoles = [[self attribute:@"canChangeCompanyRole"] boolValue];

    Menu* menu = [[Menu alloc] initWithHasWorkFlowTrays:hasWorkFlowTrays canChangeCompanyRole:canChangeCompanyRoles];

    [self iterate:@"*" usingBlock:^(RXMLElement* e) {

        if ([e.tag isEqualToString:@"ProcessArea"]) {
            [menu addProcessArea:[e asProcessArea]];
        }

        else if ([e.tag isEqualToString:@"Roles"]) {
            [e iterate:@"*" usingBlock:^(RXMLElement* roleElement) {
                [menu addUserRole:[roleElement asUserRole]];
            }];

        }
    }];
    return menu;

}

- (ProcessArea*) asProcessArea {
    if (![self.tag isEqualToString:@"ProcessArea"]) {
        [NSException raise:NSInvalidArgumentException format:@"Element is not a ProcessArea."];
    }
    ProcessArea* processArea =
            [[ProcessArea alloc] initWithProcessId:[self attribute:@"id"] andTitle:[self attribute:@"title"]];
    [self iterate:@"*" usingBlock:^(RXMLElement* e) {
        [processArea addMenuItem:[e asMenuItem]];
    }];
    return processArea;
}

- (MenuItem*) asMenuItem {
    ActivityStyle* style = [ActivityStyle fromString:[self attribute:@"style"]];
    return [[MenuItem alloc] initWithActivityId:[self attribute:@"name"] title:[self attribute:@"title"] style:style];
}

- (UserRole*) asUserRole {
    if (![self.tag isEqualToString:@"UserRole"]) {
        [NSException raise:NSInvalidArgumentException format:@"Element is not a UserRole."];
    }
    return [[UserRole alloc] initWithRoleId:[self attribute:@"id"] andDescription:[self text]];
}


@end
