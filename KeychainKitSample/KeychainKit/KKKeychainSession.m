//
//  KKKeychainSession.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainSession.h"
#import "KKKeychainRequest.h"
#import "KKError.h"

@implementation KKKeychainSession

- (void)performRequest:(KKKeychainRequest *)keychainRequest completion:(void (^)(NSArray *, NSError *))completion {
#warning TODO!
    // error example
    NSError *error = [[NSError alloc] initWithDomain:NSOSStatusErrorDomain
                                                code:KKErrorAllocateFailed
                                            userInfo:nil];
}

@end
