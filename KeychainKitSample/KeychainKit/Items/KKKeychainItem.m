//
//  KKKeychainItem.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import "KKKeychainItem.h"
@import Security;
#import "KKKeychainItem+SuclassesInterface.h"
#import "KKKeychainOperation+KeychainKitInteface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainItem ()

@property (nonatomic, copy, readwrite) NSData *data;
@property (nonatomic, copy, readwrite) NSString *label;
@property (nonatomic, copy, readwrite) NSString *accessGroup;
@property (nonatomic, assign, readwrite) KKKeychainItemAccessibility accessbility;

@end

@implementation KKKeychainItem

#pragma mark - Life Cycle

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
               accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super init];
    
    if (self) {
        self.data = data;
        self.label = label;
        self.accessGroup = accessGroup;
        self.accessbility = accessibility;
    }
    
    return self;
}

#pragma mark - Keychain mapping

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

#pragma mark - Item Conversion

/*!
 *  Converts Keychain Item into an NSDictionary.
 *
 *  @param error an error which will be set if something goes wrong.
 *
 *  @return An NSDictionary filled with data from Keychain Item. Will be empty if does not contain any data,
 */
- (NSDictionary *)keychainAttributesWithError:(NSError *__autoreleasing *)error {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    SecAccessControlRef (*pointerToSecAccessControlCreateWithFlags)(CFAllocatorRef allocator,
                                                                    CFTypeRef protection,
                                                                    SecAccessControlCreateFlags flags,
                                                                    CFErrorRef *error);
    pointerToSecAccessControlCreateWithFlags = SecAccessControlCreateWithFlags;
    if (pointerToSecAccessControlCreateWithFlags != nil) {
        CFErrorRef accessControlError = NULL;
        SecAccessControlRef accessControl =
        SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                        [self accessControlProtectionFromItem],
                                        kSecAccessControlUserPresence,
                                        &accessControlError);
        if (accessControlError) { // was there any error
            *error = (__bridge_transfer NSError *)accessControlError;
            return nil;
        }
        [attributes setObjectSafely:(__bridge_transfer id)accessControl
                             forKey:(__bridge id)kSecAttrAccessControl];
    } else {
        [attributes setObject:(__bridge id)[self accessControlProtectionFromItem]
                       forKey:(__bridge id)kSecAttrAccessible];
    }
    [attributes setObjectSafely:self.data forKey:(__bridge id)kSecValueData];
    [attributes setObjectSafely:self.label forKey:(__bridge id)kSecAttrLabel];
    return [attributes copy];
}

@end
