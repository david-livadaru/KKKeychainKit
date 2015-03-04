//
//  KKKeychainOperation+KeychainKitInteface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainOperation (KeychainKitInteface)

- (void)executeWithCompletionBlock:(void (^)(NSArray *items, NSError *error))completionBlock;

@end
