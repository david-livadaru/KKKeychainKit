//
//  KKKKeychainAddOperation.m
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKKeychainAddOperation.h"
@import Security;
#import "KKKeychainOperation+SubclassesInterface.h"

@implementation KKKKeychainAddOperation

#pragma mark - Execution

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return SecItemAdd((__bridge CFDictionaryRef)attributes, result);
}

@end
