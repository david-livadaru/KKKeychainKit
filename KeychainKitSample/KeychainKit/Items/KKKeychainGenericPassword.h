//
//  KKKeychainGenericPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainPassword.h"

@interface KKKeychainGenericPassword : KKKeychainPassword

/*!
 *  @abstract
 *      A string that represents the service associated with this item.
 *      (Exmaple: "com.apple.iDevice.PasscodeScreen")
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrService).
 */
@property (nonatomic, copy, readonly) NSString *service;
/*!
 *  @abstract
 *      Contains a user-defined data.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrGeneric).
 */
@property (nonatomic, copy, readonly) NSData *generic;

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
                  isNegative:(BOOL)isNegative account:(NSString *)account service:(NSString *)service
                     generic:(NSData *)generic accessibility:(KKKeychainItemAccessibility)accessibility;

@end
