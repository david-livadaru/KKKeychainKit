//
//  KKKeychainItemBuilder+SubclassesInterface.h
//  KeychainKitSample
//
//  Created by david on 27/02/15.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainItemBuilder (SubclassesInterface)

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary NS_REQUIRES_SUPER;

@end
