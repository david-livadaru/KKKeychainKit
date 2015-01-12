//
//  KKKeychainItem.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainItem.h"
#import "KKKeychainItem_KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainItem ()

/*!
 *  @abstract
 *      Item's content data.
 */
@property (nonatomic, strong, readwrite) NSData                         *data;
/*!
 *  @abstract
 *      User-visible label for this Keychain Item.
 */
@property (nonatomic, strong, readwrite) NSString                       *label;
/*!
 *  @abstract
 *      Indicates which access group a Keychain Item is in.
 *
 *  @discussion
 *      Access groups can be used to share Keychain Items among two or more applications.
 *      For applications to share a keychain item, the applications must have a common 
 *      access group listed in their keychain-access-groups entitlement.
 */
@property (nonatomic, strong, readwrite) NSString                       *accessGroup;
/*!
 *  @abstract
 *      A value which indicates item's accessibility.
 *
 *  @discussion
 *      You should choose the most restrictive option that meets your app’s needs so
 *      that iOS can protect that item to the greatest extent possible.
 *      See enumeration for possible values.
 */
@property (nonatomic, assign, readwrite) KKKeychainItemAccessibility    accessbility;

@end

@implementation KKKeychainItem

#pragma mark - Life Cycle

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some 
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup {
    self = [super init];
    
    if (self) {
        self.data = data;
        self.label = label;
        self.accessGroup = accessGroup;
    }
    
    return self;
}

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
               accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [self initWithData:data label:label accessGroup:accessGroup];
    
    if (self) {
        self.accessbility = accessibility;
    }
    
    return self;
}

#pragma mark - Keychain mapping

/*!
 *  Updates this item with content values from dictionary.
 *
 *  @param attributes An NSDictionary which contain data.
 */
- (void)updateItemWithAttributes:(NSDictionary *)attributes {
    NSData *data = [attributes objectForKey:(__bridge id)kSecValueData];
    if (data) {
        self.data = data;
    }
    NSString *label = [attributes objectForKey:(__bridge id)kSecAttrLabel];
    if (label) {
        self.label = label;
    }
    NSString *accessGroup = [attributes objectForKey:(__bridge id)kSecAttrAccessGroup];
    if (accessGroup) {
        self.accessGroup = accessGroup;
    }
    // Accessibility is not updated because it's a set only property at initilization.
    // If needs to be changed, current item in keychain but be deleted and create a new one with
    // diferent accessibility.
}

/*!
 *  Converts Keychain Item into an NSDictionary.
 *  The error will be set only on iOS 8 and later.
 *
 *  @param error an error which will be set if something goes wrong.
 *
 *  @return An NSDictionary filled with data from Keychain Item. Will be empty if does not contain any data,
 */
- (NSDictionary *)keychainAttributesWithError:(NSError *__autoreleasing *)error {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersion)]) { // iOS 8.0 or later?
        CFErrorRef accessControlError = NULL;
        SecAccessControlRef accessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                                                            [self accessControlProtectionFromItem],
                                                                            kSecAccessControlUserPresence,
                                                                            &accessControlError);
        if (accessControlError) { // was there any error
            *error = (__bridge_transfer NSError *)accessControlError;
            return nil;
        }
        [attributes setObjectSafely:(__bridge_transfer id)accessControl
                             forKey:(__bridge id)kSecAttrAccessControl];
    }
    [attributes setObjectSafely:self.data
                         forKey:(__bridge id)kSecValueData];
    return [attributes copy];
}

/*!
 *  @return CFTypeRef associated to access control protection chosen by item creator.
 */
- (CFTypeRef)accessControlProtectionFromItem {
    switch (self.accessbility) {
        case KKKeychainItemAccessibleAlways:
            return kSecAttrAccessibleAlways;
        case KKKeychainItemAccessibleAlwaysThisDeviceOnly:
            return kSecAttrAccessibleAlwaysThisDeviceOnly;
        case KKKeychainItemAccessibleAfterFirstUnlock:
            return kSecAttrAccessibleAfterFirstUnlock;
        case KKKeychainItemAccessibleAfterFirstUnlockThisDeviceOnly:
            return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
        case KKKeychainItemAccessibleWhenUnlocked:
            return kSecAttrAccessibleWhenUnlocked;
        case KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly:
            return kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
        case KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly:
            return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly;
    }
}

@end
