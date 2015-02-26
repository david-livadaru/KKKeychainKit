//
//  KKKeychainItemBuilder+SubclassesInterface.h
//  KeychainKitSample
//
//  Created by david on 27/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainItemBuilder (SubclassesInterface)

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary NS_REQUIRES_SUPER;

@end
