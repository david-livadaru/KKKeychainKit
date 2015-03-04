//
//  KKKeychainInternetPasswordBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
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
