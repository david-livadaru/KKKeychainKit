//
//  KKKeychainPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainItem.h"

@interface KKKeychainPassword : KKKeychainItem

/*!
 *  @abstract
 *      Represents the date the item was created.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrCreationDate).
 */
@property (nonatomic, readonly) NSDate *creationDate;
/*!
 *  @abstract
 *      Represents the last time the item was updated.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrModificationDate).
 */
@property (nonatomic, readonly) NSDate *modificationDate;
/*!
 *  @abstract
 *      A string which describes the item.
 *      (Examples:"Login credentials.", "An object which represent serialization of this class")
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrDescription).
 */
@property (nonatomic, copy, readonly) NSString *itemDescription;
/*!
 *  @abstract
 *      User-defined comment for this item.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrComment).
 */
@property (nonatomic, copy, readonly) NSString *comment;
/*!
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrCreator).
 */
@property (nonatomic, readonly) NSNumber *creator;
/*!
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrType).
 */
@property (nonatomic, readonly) NSNumber *type;
/*!
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrIsInvisible).
 */
@property (nonatomic, assign, readonly, getter=isInvisible) BOOL invisible;
/*!
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrIsNegative).
 */
@property (nonatomic, assign, readonly, getter=isNegative) BOOL negative;
/*!
 *  @abstract
 *      Contains an account name.
 *  @see https://developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys official documentation (search for kSecAttrAccount).
 */
@property (nonatomic, copy, readonly) NSString *account;

@end
