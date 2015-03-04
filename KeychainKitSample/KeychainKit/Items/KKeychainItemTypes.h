//
//  KKeychainItemTypes.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import <Foundation/Foundation.h>

/*!
 *  Enumeration which provides different ways of provinding accessibility to Keychain Items.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Keychain_Item_Accessibility_Constants official documentation.
 */
typedef NS_ENUM(NSUInteger, KKKeychainItemAccessibility){
    KKKeychainItemAccessibleAlways,
    KKKeychainItemAccessibleAlwaysThisDeviceOnly,
    KKKeychainItemAccessibleAfterFirstUnlock,
    KKKeychainItemAccessibleAfterFirstUnlockThisDeviceOnly,
    KKKeychainItemAccessibleWhenUnlocked,
    KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly,
    KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly NS_ENUM_AVAILABLE_IOS(8_0)
};

/*!
 *  Enumeration which provides possbile values for protocol.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Protocol_Values official documentation.
 */
typedef NS_ENUM(NSUInteger, KKKeychainProtocol){
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

/*!
 *  Enumeration which provides possbile values for authentication type.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Authentication_Type_Values official documentation.
 */
typedef NS_ENUM(NSUInteger, KKKeychainAuthenticationType){
    KKKeychainAuthenticationTypeNTLM,
    KKKeychainAuthenticationTypeMSN,
    KKKeychainAuthenticationTypeDPA,
    KKKeychainAuthenticationTypeRPA,
    KKKeychainAuthenticationTypeHTMLForm,
    KKKeychainAuthenticationTypeHTTPBasic,
    KKKeychainAuthenticationTypeHTTPDigest,
    KKKeychainAuthenticationTypeDefault
};

