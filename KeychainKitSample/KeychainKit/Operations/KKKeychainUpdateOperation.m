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
    return errSecUnimplemented;
//    return SecItemUpdate(NULL, (__bridge CFDictionaryRef)attributes);
}

@end
