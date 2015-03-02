//
//  KKKeychainItemBuilder+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 27/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>

@class KKKeychainSession;

@interface KKKeychainItemBuilder (KeychainKitInterface)

+ (instancetype)builderWithKeychainItemClass:(CFTypeRef)keychainItemClass
                             keychainSession:(KKKeychainSession *)keychainSession;

- (id)buildKeychainItemFromDictionary:(NSDictionary *)dictionary;

@end
