//
//  KKKeychainItem.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import <Foundation/Foundation.h>
#import <KeychainKit/KKeychainItemTypes.h>

@interface KKKeychainItem : NSObject

/*!
 *  @abstract
 *      Item's content data.
 */
@property (nonatomic, copy, readonly) NSData *data;
/*!
 *  @discussion
 *      Label is a property which can be seen as a key for the item from Keychain.
 *      This property is required when the item is updated.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrLabel).
 */
@property (nonatomic, copy, readonly) NSString *label;
/*!
 *  @abstract
 *      Indicates which access group a Keychain Item is associated with.
 *
 *  @discussion
 *      Access groups can be used to share Keychain Items among two or more applications.
 *      For applications to share a keychain item, the applications must have a common
 *      access group listed in their keychain-access-groups entitlement.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrAccessGroup).
 */
@property (nonatomic, copy, readonly) NSString *accessGroup;
/*!
 *  @abstract
 *      A value which indicates item's accessibility.
 *
 *  @discussion
 *      You should choose the most restrictive option that meets your app’s needs so
 *      that iOS can protect that item to the greatest extent possible.
 *      See enumeration for possible values.
 @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrAccessible).
 */
@property (nonatomic, assign, readonly) KKKeychainItemAccessibility accessbility;

@end
