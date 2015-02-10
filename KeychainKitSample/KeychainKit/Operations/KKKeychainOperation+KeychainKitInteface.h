//
//  KKKeychainOperation+KeychainKitInteface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainOperation (KeychainKitInteface)

// Execution
- (void)executeWithCompletionBlock:(void (^)(NSArray *items, NSError *error))completionBlock;

@end
