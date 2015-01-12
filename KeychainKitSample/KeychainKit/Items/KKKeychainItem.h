//
//  KKKeychainItem.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
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
    KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly
} NS_ENUM_AVAILABLE_IOS(8_0);

@interface KKKeychainItem : NSObject

@property (nonatomic, strong, readonly) NSData                          *data;
@property (nonatomic, strong, readonly) NSString                        *label;
@property (nonatomic, strong, readonly) NSString                        *accessGroup;
@property (nonatomic, assign, readonly) KKKeychainItemAccessibility     accessbility NS_AVAILABLE_IOS(8_0);

@end
