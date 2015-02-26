//
//  KKKeychainInternetPasswordBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPasswordBuilder.h"

@interface KKKeychainInternetPasswordBuilder : KKKeychainPasswordBuilder

@property (nonatomic, strong) NSString *securityDomain;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, assign) KKKeychainProtocol protocol;
@property (nonatomic, assign) KKKeychainAuthenticationType authenticationType;
@property (nonatomic, strong) NSNumber *port;
@property (nonatomic, strong) NSString *path;

@end
