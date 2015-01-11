//
//  KKKeychainSession.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKKeychainOperation;

@interface KKKeychainSession : NSObject

// Facilities
- (void)performOperation:(KKKeychainOperation *)operation completion:(void (^)(NSArray *items, NSError *error))completion;

@end
