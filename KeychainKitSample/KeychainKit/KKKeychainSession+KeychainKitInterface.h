//
//  KKKeychainSession+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainSession (KeychainKitInterface)

@property (nonatomic, strong, readonly) NSString *appID;

@end
