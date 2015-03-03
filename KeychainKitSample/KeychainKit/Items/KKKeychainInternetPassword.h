//
//  KKKeychainInternetPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainPassword.h"

@interface KKKeychainInternetPassword : KKKeychainPassword

/*!
 *  @abstract
 *      Represents the Internet security domain.
 *      Examples: NIPRNet, SIPRNet. JWICS, NSANet.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrSecurityDomain).
 */
@property (nonatomic, copy, readonly) NSString *securityDomain;
/*!
 *  @abstract
 *      Server's domain name or IP address.
 *      Examples: apple.com or 127.0.0.1 .
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrServer).
 */
@property (nonatomic, copy, readonly) NSString *server;
/*!
 *  @abstract
 *      See enumeration for possible values.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrProtocol).
 */
@property (nonatomic, assign, readonly) KKKeychainProtocol protocol;
/*!
 *  @abstract
 *      See enumeration for possible values.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrAuthenticationType).
 */
@property (nonatomic, assign, readonly) KKKeychainAuthenticationType authenticationType;
/*!
 *  @abstract
 *      Example: @80.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrPort).
 */
@property (nonatomic, strong, readonly) NSNumber *port;
/*!
 *  @abstract
 *      Example: login.html.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrPath).
 */
@property (nonatomic, copy, readonly) NSString *path;

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment
                     creator:(NSNumber *)creator type:(NSNumber *)type isInvisible:(BOOL)isInvisible
                  isNegative:(BOOL)isNegative account:(NSString *)account
              securityDomain:(NSString *)securityDomain server:(NSString *)server
                    protocol:(KKKeychainProtocol)protocol
          authenticationType:(KKKeychainAuthenticationType)authenticationType port:(NSNumber *)port
                        path:(NSString *)path accessibility:(KKKeychainItemAccessibility)accessibility;

@end
