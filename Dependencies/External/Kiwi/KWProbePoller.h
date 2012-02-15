//
//  KWProbePoller.h
//  iOSFalconCore
//
//  Created by Luke Redpath on 13/01/2011.
//  Copyright 2011 LJR Software Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWProbe.h"

#define kKW_DEFAULT_PROBE_DELAY 0.1

@interface KWProbePoller : NSObject {
    NSTimeInterval timeoutInterval;
    NSTimeInterval delayInterval;
}
- (id) initWithTimeout:(NSTimeInterval)theTimeout delay:(NSTimeInterval)theDelay;

- (BOOL) check:(id<KWProbe>)probe;
@end
