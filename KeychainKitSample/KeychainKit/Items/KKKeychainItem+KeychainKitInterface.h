//
//  KKKeychainItem+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainItem (KeychainKitInterface)

// Item Conversion
- (NSDictionary *)keychainAttributesWithError:(NSError **)error;

@end
