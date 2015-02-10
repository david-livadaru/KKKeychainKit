//
//  KKeychainItemTypes.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  Enumeration which provides different ways of provinding accessibility to Keychain Items.
 */
typedef NS_ENUM(NSUInteger, KKKeychainItemAccessibility){
    /*!
     *  Item data can always be accessed regardless of the lock state of the device.
     *  This is not recommended for anything except system use. Items with this attribute
     *  will migrate to a new device when using encrypted backups.
     */
    KKKeychainItemAccessibleAlways,
    /*!
     *  Item data can always be accessed regardless of the lock state of the device.
     *  This option is not recommended for anything except system use. Items with this
     *  attribute will never migrate to a new device, so after a backup is restored
     *  to a new device, these items will be missing.
     */
    KKKeychainItemAccessibleAlwaysThisDeviceOnly,
    /*!
     *  Item data can only be accessed once the device has been unlocked after a restart.
     *  This is recommended for items that need to be accesible by background applications.
     *  Items with this attribute will migrate to a new device when using encrypted backups.
     */
    KKKeychainItemAccessibleAfterFirstUnlock,
    /*!
     *  Item data can only be accessed once the device has been unlocked after a restart.
     *  This is recommended for items that need to be accessible by background applications.
     *  Items with this attribute will never migrate to a new device, so after a backup
     *  is restored to a new device these items will be missing.
     */
    KKKeychainItemAccessibleAfterFirstUnlockThisDeviceOnly,
    /*!
     *  Item data can only be accessed while the device is unlocked.
     *  This is recommended for items that only need be accesible while
     *  the application is in the foreground.  Items with this attribute will migrate
     *  to a new device when using encrypted backups.
     */
    KKKeychainItemAccessibleWhenUnlocked,
    /*!
     *  Item data can only be accessed while the device is unlocked.
     *  This is recommended for items that only need be accesible while
     *  the application is in the foreground. Items with this attribute will
     *  never migrate to a new device, so after a backup is restored to a new device,
     *  these items will be missing.
     */
    KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly,
    /*!
     *  Item data can always be accessed regardless of the lock state of the device.
     *  This option is not recommended for anything except system use. Items with this
     *  attribute will never migrate to a new device, so after a backup is restored
     *  to a new device, these items will be missing.
     */
    KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly NS_ENUM_AVAILABLE_IOS(8_0)
};

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

