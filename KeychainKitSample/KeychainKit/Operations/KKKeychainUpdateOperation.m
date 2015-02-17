//
//  KKKeychainUpdateOperation.m
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainUpdateOperation.h"
@import Security;
#import "KKKeychainOperation+SubclassesInterface.h"

@implementation KKKeychainUpdateOperation

#pragma mark - Execution

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    id itemLabel = [attributes objectForKey:(__bridge id)kSecAttrLabel];
    if (!itemLabel) {
        return errSecBadReq;
    }
    id itemClass = [attributes objectForKey:(__bridge id)kSecClass];
    if (!itemClass) {
        return errSecInternalComponent;
    }
    NSMutableDictionary *mutableUpdateAttributes = [attributes mutableCopy];
    [mutableUpdateAttributes removeObjectForKey:(__bridge id)kSecAttrLabel];
    [mutableUpdateAttributes removeObjectForKey:(__bridge id)kSecClass];
    NSDictionary *updateAttributes = [mutableUpdateAttributes copy];
    NSDictionary *queryAttributes = @{(__bridge id)kSecClass: itemClass,
                                      (__bridge id)kSecAttrLabel: itemLabel};
    return SecItemUpdate((__bridge CFDictionaryRef)queryAttributes, (__bridge CFDictionaryRef)updateAttributes);
}

@end
