//
//  KKKeychainItem+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainItem (KeychainKitInterface)

// Item Conversion
- (NSDictionary *)keychainAttributesWithError:(NSError **)error;

@end
