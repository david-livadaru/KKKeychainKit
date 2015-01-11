//
//  KKKeychainInternetPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"

typedef NS_ENUM(NSUInteger, KKKeychainProtocol) {
    KKKeychainProtocolFTP,
    KKKeychainProtocolFTPS,
    KKKeychainProtocolFTPProxy,
    KKKeychainProtocolFTPAccount,
    KKKeychainProtocolHTTP,
    KKKeychainProtocolHTTPS,
    KKKeychainProtocolHTTPProxy,
    KKKeychainProtocolHTTPSProxy,
    KKKeychainProtocolIRC,
    KKKeychainProtocolIRCS,
    KKKeychainProtocolNNTP,
    KKKeychainProtocolNNTPS,
    KKKeychainProtocolPOP3,
    KKKeychainProtocolPOP3S,
    KKKeychainProtocolSMTP,
    KKKeychainProtocolSOCKS,
    KKKeychainProtocolIMAP,
    KKKeychainProtocolIMAPS,
    KKKeychainProtocolLDAP,
    KKKeychainProtocolLDAPS,
    KKKeychainProtocolAppleTalk,
    KKKeychainProtocolAFP,
    KKKeychainProtocolTelnet,
    KKKeychainProtocolTelnetS,
    KKKeychainProtocolSSH,
    KKKeychainProtocolSMB,
    KKKeychainProtocolRTSP,
    KKKeychainProtocolRTSPProxy,
    KKKeychainProtocolDAAP,
    KKKeychainProtocolEPPC,
    KKKeychainProtocolIPP
};

typedef NS_ENUM(NSUInteger, KKKeychainAuthenticationType) {
    KKKeychainAuthenticationTypeNTLM,
    KKKeychainAuthenticationTypeMSN,
    KKKeychainAuthenticationTypeDPA,
    KKKeychainAuthenticationTypeRPA,
    KKKeychainAuthenticationTypeHTMLForm,
    KKKeychainAuthenticationTypeHTTPBasic,
    KKKeychainAuthenticationTypeHTTPDigest,
    KKKeychainAuthenticationTypeDefault
};

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
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port path:(NSString *)path;
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account securityDomain:(NSString *)securityDomain server:(NSString *)server
                    protocol:(KKKeychainProtocol)protocol
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port path:(NSString *)path
               accessibility:(KKKeychainItemAccessibility)accessibility NS_AVAILABLE_IOS(8_0);

@end
