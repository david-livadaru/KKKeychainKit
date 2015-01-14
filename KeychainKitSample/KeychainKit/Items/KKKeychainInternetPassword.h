//
//  KKKeychainInternetPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"

/*!
 *  Enumeration which provides possbile values for protocol.
 */
typedef NS_ENUM(NSUInteger, KKKeychainProtocol){
    /*!
     *  FTP protocol.
     */
    KKKeychainProtocolFTP,
    /*!
     *  FTP over TLS/SSL.
     */
    KKKeychainProtocolFTPS,
    /*!
     *  FTP proxy.
     */
    KKKeychainProtocolFTPProxy,
    /*!
     *  A client side FTP account.
     */
    KKKeychainProtocolFTPAccount,
    /*!
     *  HTTP protocol.
     */
    KKKeychainProtocolHTTP,
    /*!
     *  HTTP over TLS/SSL.
     */
    KKKeychainProtocolHTTPS,
    /*!
     *  HTTP proxy.
     */
    KKKeychainProtocolHTTPProxy,
    /*!
     *  HTTPS proxy.
     */
    KKKeychainProtocolHTTPSProxy,
    /*!
     *  IRC protocol.
     */
    KKKeychainProtocolIRC,
    /*!
     *  IRC over TLS/SSL.
     */
    KKKeychainProtocolIRCS,
    /*!
     *  NNTP protocol.
     */
    KKKeychainProtocolNNTP,
    /*!
     *  NNTP over TLS/SSL.
     */
    KKKeychainProtocolNNTPS,
    /*!
     *  POP3 protocol.
     */
    KKKeychainProtocolPOP3,
    /*!
     *  POP3 over TLS/SSL.
     */
    KKKeychainProtocolPOP3S,
    /*!
     *  SMTP protocol.
     */
    KKKeychainProtocolSMTP,
    /*!
     *  SOCKS protocol.
     */
    KKKeychainProtocolSOCKS,
    /*!
     *  IMAP protocol.
     */
    KKKeychainProtocolIMAP,
    /*!
     *  IMAP over TLS/SSL.
     */
    KKKeychainProtocolIMAPS,
    /*!
     *  LDAP protocol.
     */
    KKKeychainProtocolLDAP,
    /*!
     *  LDAP over TLS/SSL.
     */
    KKKeychainProtocolLDAPS,
    /*!
     *  AFP over AppleTalk.
     */
    KKKeychainProtocolAppleTalk,
    /*!
     *  AFP over TCP.
     */
    KKKeychainProtocolAFP,
    /*!
     *  Telnet protocol.
     */
    KKKeychainProtocolTelnet,
    /*!
     *  Telnet over TLS/SSL.
     */
    KKKeychainProtocolTelnetS,
    /*!
     *  SSH protocol.
     */
    KKKeychainProtocolSSH,
    /*!
     *  SMB protocol.
     */
    KKKeychainProtocolSMB,
    /*!
     *  RTSP protocol.
     */
    KKKeychainProtocolRTSP,
    /*!
     *  RTSP proxy.
     */
    KKKeychainProtocolRTSPProxy,
    /*!
     *  DAAP protocol.
     */
    KKKeychainProtocolDAAP,
    /*!
     *  Remote Apple Events.
     */
    KKKeychainProtocolEPPC,
    /*!
     *  IPP protocol.
     */
    KKKeychainProtocolIPP
};

/*!
 *  Enumeration which provides possbile values for authentication type.
 */
typedef NS_ENUM(NSUInteger, KKKeychainAuthenticationType){
    /*!
     *  Windows NT LAN Manager authentication.
     */
    KKKeychainAuthenticationTypeNTLM,
    /*!
     *  Microsoft Network default authentication.
     */
    KKKeychainAuthenticationTypeMSN,
    /*!
     *  Distributed Password authentication.
     */
    KKKeychainAuthenticationTypeDPA,
    /*!
     *  Remote Password authentication.
     */
    KKKeychainAuthenticationTypeRPA,
    /*!
     *  HTML form based authentication.
     */
    KKKeychainAuthenticationTypeHTMLForm,
    /*!
     *  HTTP Basic authentication.
     */
    KKKeychainAuthenticationTypeHTTPBasic,
    /*!
     *  HTTP Digest Access authentication.
     */
    KKKeychainAuthenticationTypeHTTPDigest,
    /*!
     *  The default authentication type.
     */
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
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port path:(NSString *)path
               accessibility:(KKKeychainItemAccessibility)accessibility;

@end
