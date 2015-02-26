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

#pragma mark - Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item {
    self = [super initWithOperationType:operationType item:item];
    
    if (self) {
        self.searchLimit = KKKeychainSearchLimitOne;
    }
    
    return self;
}

#pragma mark - Execution

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    NSMutableDictionary *mutableAttributes = [attributes mutableCopy];
    [mutableAttributes setObject:(__bridge id)kSecMatchLimit forKey:(__bridge id)self.convertedSearchLimit];
    attributes = [mutableAttributes copy];
    return SecItemCopyMatching((__bridge CFDictionaryRef)attributes, result);
}

#pragma mark - Conversion

- (CFTypeRef)convertedSearchLimit {
    switch (self.searchLimit) {
        case KKKeychainSearchLimitOne:
            return kSecMatchLimitOne;
        case KKKeychainSearchLimitAll:
            return kSecMatchLimitAll;
        default:
            break;
    }
}

@end
