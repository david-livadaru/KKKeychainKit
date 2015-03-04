//
//  KKKKeychainAddOperation.m
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import "KKKeychainAddOperation.h"
@import Security;
#import "KKKeychainOperation+SubclassesInterface.h"

@implementation KKKeychainAddOperation

#pragma mark - Execution

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return SecItemAdd((__bridge CFDictionaryRef)attributes, result);
}

@end
