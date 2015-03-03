//
//  KKKeychainItemBuilder+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 27/02/15.
//

#import <KeychainKit/KeychainKit.h>

@class KKKeychainSession;

@interface KKKeychainItemBuilder (KeychainKitInterface)

+ (instancetype)builderWithKeychainItemClass:(CFTypeRef)keychainItemClass
                             keychainSession:(KKKeychainSession *)keychainSession;

- (id)buildKeychainItemFromDictionary:(NSDictionary *)dictionary;

@end
