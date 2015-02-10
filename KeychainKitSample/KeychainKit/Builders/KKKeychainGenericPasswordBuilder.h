//
//  KKKeychainGenericPasswordBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPasswordBuilder.h"

@interface KKKeychainGenericPasswordBuilder : KKKeychainPasswordBuilder

@property (nonatomic, strong) NSString *service;
@property (nonatomic, strong) NSData *generic;

@end
