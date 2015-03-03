//
//  KKKeychainDeleteOperation.m
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import "KKKeychainDeleteOperation.h"
@import Security;
#import "KKKeychainOperation+SubclassesInterface.h"

@implementation KKKeychainDeleteOperation

#pragma mark - Execution

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return SecItemDelete((__bridge CFDictionaryRef)attributes);
}

@end
