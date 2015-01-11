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
 @abstract
 Abstract description.
 
 @discussion
 Discussion description.
 */
@property (nonatomic, strong, readwrite) NSData                         *data;
@property (nonatomic, strong, readwrite) NSString                       *label;
@property (nonatomic, strong, readwrite) NSString                       *accessGroup;
@property (nonatomic, assign, readwrite) KKKeychainItemAccessibility    accessbility;

@end

@implementation KKKeychainItem

#pragma mark - Life Cycle

/*!
 *  Description
 *
 *  @param data        data description
 *  @param serviceName serviceName description
 *
 *  @return return value description
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

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
               accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [self initWithData:data label:label accessGroup:accessGroup];
    
    if (self) {
        self.accessbility = accessibility;
    }
    
    return self;
}

#pragma mark - Keychain mapping

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
