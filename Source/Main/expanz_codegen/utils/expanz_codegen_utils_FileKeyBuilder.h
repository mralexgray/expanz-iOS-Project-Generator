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
#import <CommonCrypto/CommonDigest.h>

#define HASH_VALUE_STORAGE_SIZE 48

typedef struct {
    char value[CC_MD5_DIGEST_LENGTH];
} HashValueMD5Hash;


@interface expanz_codegen_utils_FileKeyBuilder : NSObject {
    unsigned char _value[HASH_VALUE_STORAGE_SIZE];
}

+ (expanz_codegen_utils_FileKeyBuilder*) forFileName:(NSString*)fileName;

- (id) initHashValueMD5HashWithBytes:(const void*)bytes length:(NSUInteger)length;

- (NSString*) build;

@end

/* ================================================================================================================== */
@compatibility_alias FileKeyBuilder expanz_codegen_utils_FileKeyBuilder;
