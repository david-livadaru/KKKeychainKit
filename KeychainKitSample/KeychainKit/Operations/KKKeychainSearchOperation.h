//
//  KKKeychainSearchOperation.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainOperation.h"

typedef NS_ENUM(NSUInteger, KKKeychainSearchLimit) {
    KKKeychainSearchLimitOne,
    KKKeychainSearchLimitAll
};

@interface KKKeychainSearchOperation : KKKeychainOperation

@property (nonatomic, assign) KKKeychainSearchLimit     searchLimit; // default is KKKeychainSearchLimitOne

@end
