//
//  KKKeychainSession.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainSession.h"
#import "KKKeychainOperation.h"
#import "KKKeychainOperation+KeychainKitInteface.h"

@implementation KKKeychainSession

#pragma mark - Facilities

- (void)performOperation:(KKKeychainOperation *)operation
         completionBlock:(void (^)(NSArray *items, NSError *error))completionBlock {
    [operation executeWithCompletionBlock:completionBlock];
    // TO BE IMPLEMENTED
#warning check if this class is really necessary
}

@end
