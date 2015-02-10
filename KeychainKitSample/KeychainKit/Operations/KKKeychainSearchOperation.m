//
//  KKKeychainSearchOperation.m
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSearchOperation.h"
@import Security;
#import "KKKeychainOperation+SubclassesInterface.h"

@implementation KKKeychainSearchOperation

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return SecItemCopyMatching((__bridge CFDictionaryRef)attributes, result);
}

@end
