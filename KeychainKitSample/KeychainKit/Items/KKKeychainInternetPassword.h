//
//  KKKeychainInternetPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"

@interface KKKeychainInternetPassword : KKKeychainPassword

@property (nonatomic, strong, readonly) NSString                        *securityDomain;
@property (nonatomic, strong, readonly) NSString                        *server;
@property (nonatomic, assign, readonly) KKKeychainProtocol              protocol;
@property (nonatomic, assign, readonly) KKKeychainAuthenticationType    authenticationType;
@property (nonatomic, strong, readonly) NSNumber                        *port;
@property (nonatomic, strong, readonly) NSString                        *path;

// Object Life Cycle
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account securityDomain:(NSString *)securityDomain server:(NSString *)server
                    protocol:(KKKeychainProtocol)protocol
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port path:(NSString *)path
               accessibility:(KKKeychainItemAccessibility)accessibility;

@end
