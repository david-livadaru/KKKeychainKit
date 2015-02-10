//
//  KKKeychainItem_KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainItem.h"

@interface KKKeychainItem ()

// Object Life Cycle
- (instancetype)initWithData:(NSData *)data
                       label:(NSString *)label
                 accessGroup:(NSString *)accessGroup
               accessibility:(KKKeychainItemAccessibility)accessibility;

// Keychain mapping
- (void)updateItemWithAttributes:(NSDictionary *)attributes;

@end
