//
//  KKKeychainInternetPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainInternetPassword.h"
#import "KKKeychainItem_KeychainKitInterface.h"
#import "KKKeychainPassword_KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainInternetPassword ()

@property (nonatomic, strong, readwrite) NSString                       *securityDomain;
@property (nonatomic, strong, readwrite) NSString                       *server;
@property (nonatomic, assign, readwrite) KKKeychainProtocol             protocol;
@property (nonatomic, assign, readwrite) KKKeychainAuthenticationType   authenticationType;
@property (nonatomic, strong, readwrite) NSNumber                       *port;
@property (nonatomic, strong, readwrite) NSString                       *path;

@end

@implementation KKKeychainInternetPassword

#pragma mark - Object Life Cycle

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account securityDomain:(NSString *)securityDomain server:(NSString *)server
                    protocol:(KKKeychainProtocol)protocol
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port
                        path:(NSString *)path {
    self = [super initWithData:data label:label accessGroup:accessGroup creationDate:creationDate
              modificationDate:modificationDate itemDescription:itemDescription comment:comment creator:creator
                          type:type isInvisible:isInvisible isNegative:isNegative account:account];
    
    if (self) {
        [self updateObjectWithSecurityDomain:securityDomain server:server protocol:protocol
                          authenticationType:authenticationType port:port path:path];
    }
    
    return self;
}

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account securityDomain:(NSString *)securityDomain server:(NSString *)server
                    protocol:(KKKeychainProtocol)protocol
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port
                        path:(NSString *)path accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup creationDate:creationDate
              modificationDate:modificationDate itemDescription:itemDescription comment:comment creator:creator
                          type:type isInvisible:isInvisible isNegative:isNegative account:accessGroup
                 accessibility:accessibility];
    
    if (self) {
        [self updateObjectWithSecurityDomain:securityDomain server:server protocol:protocol
                          authenticationType:authenticationType port:port path:path];
    }
    
    return self;
}

- (void)updateObjectWithSecurityDomain:(NSString *)securityDomain server:(NSString *)server
                              protocol:(KKKeychainProtocol)protocol 
                    authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port
                                  path:(NSString *)path {
    self.securityDomain = securityDomain;
    self.server = server;
    self.protocol = protocol;
    self.authenticationType = authenticationType;
    self.port = port;
    self.path = path;
}

#pragma mark - Keychain mapping

- (void)updateItemWithAttributes:(NSDictionary *)attributes {
    NSString *securityDomain = [attributes objectForKey:(__bridge id)kSecAttrSecurityDomain];
    if (securityDomain) {
        self.securityDomain = securityDomain;
    }
    NSString *server = [attributes objectForKey:(__bridge id)kSecAttrServer];
    if (server) {
        self.server = server;
    }
    NSNumber *port = [attributes objectForKey:(__bridge id)kSecAttrPort];
    if (port) {
        self.port = port;
    }
    NSString *path = [attributes objectForKey:(__bridge id)kSecAttrPath];
    if (path) {
        self.path = path;
    }
    // Protocol and authenticationType are not updated because they're set only properties at initilization.
    // If need to be changed, current item in keychain but be deleted and create a new one with
    // diferent protocol and/or authenticationType.
}

- (NSDictionary *)keychainAttributesWithError:(NSError **)error {
    NSDictionary *attributes = [super keychainAttributesWithError:error];
    if (attributes) {
        NSMutableDictionary *mutableAttributes = [[NSMutableDictionary alloc] initWithDictionary:attributes];
        [mutableAttributes setObjectSafely:(__bridge id)kSecClassInternetPassword
                                    forKey:(__bridge id)kSecClass];
        [mutableAttributes setObjectSafely:self.securityDomain
                                    forKey:(__bridge id)kSecAttrSecurityDomain];
        [mutableAttributes setObjectSafely:self.server
                                    forKey:(__bridge id)kSecAttrServer];
        [mutableAttributes setObjectSafely:[self protocolFromInternetPassword]
                                    forKey:(__bridge id)kSecAttrProtocol];
        [mutableAttributes setObjectSafely:[self authenticationTypeFromInternetPassword]
                                    forKey:(__bridge id)kSecAttrAuthenticationType];
        [mutableAttributes setObjectSafely:self.port
                                    forKey:(__bridge id)kSecAttrPath];
    }
    return attributes;
}

- (CFTypeRef)protocolFromInternetPassword {
    switch (self.protocol) {
        case KKKeychainProtocolFTP:
            return kSecAttrProtocolFTP;
        case KKKeychainProtocolFTPS:
            return kSecAttrProtocolFTPS;
        case KKKeychainProtocolFTPProxy:
            return kSecAttrProtocolFTPProxy;
        case KKKeychainProtocolFTPAccount:
            return kSecAttrProtocolFTPAccount;
        case KKKeychainProtocolHTTP:
            return kSecAttrProtocolHTTP;
        case KKKeychainProtocolHTTPS:
            return kSecAttrProtocolHTTPS;
        case KKKeychainProtocolHTTPProxy:
            return kSecAttrProtocolHTTPProxy;
        case KKKeychainProtocolHTTPSProxy:
            return kSecAttrProtocolHTTPSProxy;
        case KKKeychainProtocolIRC:
            return kSecAttrProtocolIRC;
        case KKKeychainProtocolIRCS:
            return kSecAttrProtocolIRCS;
        case KKKeychainProtocolNNTP:
            return kSecAttrProtocolNNTP;
        case KKKeychainProtocolNNTPS:
            return kSecAttrProtocolNNTPS;
        case KKKeychainProtocolPOP3:
            return kSecAttrProtocolPOP3;
        case KKKeychainProtocolPOP3S:
            return kSecAttrProtocolPOP3S;
        case KKKeychainProtocolSMTP:
            return kSecAttrProtocolSMTP;
        case KKKeychainProtocolSOCKS:
            return kSecAttrProtocolSOCKS;
        case KKKeychainProtocolIMAP:
            return kSecAttrProtocolIMAP;
        case KKKeychainProtocolIMAPS:
            return kSecAttrProtocolIMAPS;
        case KKKeychainProtocolLDAP:
            return kSecAttrProtocolLDAP;
        case KKKeychainProtocolLDAPS:
            return kSecAttrProtocolLDAPS;
        case KKKeychainProtocolAppleTalk:
            return kSecAttrProtocolAppleTalk;
        case KKKeychainProtocolAFP:
            return kSecAttrProtocolAFP;
        case KKKeychainProtocolTelnet:
            return kSecAttrProtocolTelnet;
        case KKKeychainProtocolTelnetS:
            return kSecAttrProtocolTelnetS;
        case KKKeychainProtocolSSH:
            return kSecAttrProtocolSSH;
        case KKKeychainProtocolSMB:
            return kSecAttrProtocolSMB;
        case KKKeychainProtocolRTSP:
            return kSecAttrProtocolRTSP;
        case KKKeychainProtocolRTSPProxy:
            return kSecAttrProtocolRTSPProxy;
        case KKKeychainProtocolDAAP:
            return kSecAttrProtocolDAAP;
        case KKKeychainProtocolEPPC:
            return kSecAttrProtocolEPPC;
        case KKKeychainProtocolIPP:
            return kSecAttrProtocolIPP;
    }
}

- (CFTypeRef)authenticationTypeFromInternetPassword {
    switch (self.authenticationType) {
        case KKKeychainAuthenticationTypeNTLM:
            return kSecAttrAuthenticationTypeNTLM;
        case KKKeychainAuthenticationTypeMSN:
            return kSecAttrAuthenticationTypeMSN;
        case KKKeychainAuthenticationTypeDPA:
            return kSecAttrAuthenticationTypeDPA;
        case KKKeychainAuthenticationTypeRPA:
            return kSecAttrAuthenticationTypeRPA;
        case KKKeychainAuthenticationTypeHTMLForm:
            return kSecAttrAuthenticationTypeHTMLForm;
        case KKKeychainAuthenticationTypeHTTPBasic:
            return kSecAttrAuthenticationTypeHTTPBasic;
        case KKKeychainAuthenticationTypeHTTPDigest:
            return kSecAttrAuthenticationTypeHTTPDigest;
        case KKKeychainAuthenticationTypeDefault:
            return kSecAttrAuthenticationTypeDefault;
    }
}

@end
