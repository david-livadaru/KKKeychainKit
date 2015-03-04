//
//  KKKeychainItemBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import "KKKeychainItemBuilder.h"
#import "KKKeychainItemBuilder+KeychainKitInterface.h"
#import "KKKeychainItemBuilder+SubclassesInterface.h"
#import "KKKeychainSession.h"
#import "KKKeychainSession+KeychainKitInterface.h"
#import "KKKeychainGenericPasswordBuilder.h"
#import "KKKeychainInternetPasswordBuilder.h"

@interface KKKeychainItemBuilder ()

@property (nonatomic, strong) KKKeychainSession *keychainSession;

@end

@implementation KKKeychainItemBuilder

#pragma mark - Life Cycle

- (instancetype)initWithKeychainSession:(KKKeychainSession *)keychainSession {
    self = [super init];
    
    if (self) {
        self.keychainSession = keychainSession;
        self.accessibility = KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly;
    }
    
    return self;
}

+ (instancetype)builderWithKeychainItemClass:(CFTypeRef)keychainItemClass
                             keychainSession:(KKKeychainSession *)keychainSession {
    if (keychainItemClass == kSecClassGenericPassword) {
        return [[KKKeychainGenericPasswordBuilder alloc] initWithKeychainSession:keychainSession];
    } else if (keychainItemClass == kSecClassInternetPassword) {
        return [[KKKeychainInternetPasswordBuilder alloc] initWithKeychainSession:keychainSession];
    } else {
        return nil;
    }
}

#pragma mark - Building

- (id)buildKeychainItem {
    return nil; // client is not allowed to create incomplete object
}

#pragma mark - Setters

- (void)setAccessGroup:(NSString *)accessGroup {
    NSString *newAcessGroup = [self.keychainSession.appID stringByAppendingFormat:@".%@", accessGroup];
    if ([_accessGroup compare:newAcessGroup] != NSOrderedSame) {
        _accessGroup = newAcessGroup;
    }
}


#pragma mark - KeychainKit Interface

- (id)buildKeychainItemFromDictionary:(NSDictionary *)dictionary {
    return nil;
}

#pragma mark - KKKeychainItemBuilder Subclasses interface

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary {
    NSData *data = [dictionary objectForKey:(__bridge id)kSecValueData];
    if (data) {
        self.data = data;
    }
    NSString *label = [dictionary objectForKey:(__bridge id)kSecAttrLabel];
    if (label) {
        self.label = label;
    }
    NSString *accessGroup = [dictionary objectForKey:(__bridge id)kSecAttrAccessGroup];
    if (accessGroup) {
        self.accessGroup = accessGroup;
    }
    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersion)]) {
#warning Cannot get protection 'field' from SecAccessControlRef
        SecAccessControlRef accessControl =
        (__bridge SecAccessControlRef)[dictionary objectForKey:(__bridge id)kSecAttrAccessControl];
        self.accessibility = KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly;
    } else {
        CFTypeRef accessibilityTypeRef = (__bridge CFTypeRef)dictionary[(__bridge id)kSecAttrAccessible];
        self.accessibility = [self accessibilityFromTypeRef:accessibilityTypeRef];
    }
}

- (KKKeychainItemAccessibility)accessibilityFromTypeRef:(CFTypeRef)typeRef {
    if (typeRef == kSecAttrAccessibleAlways) {
        return KKKeychainItemAccessibleAlways;
    } else if (typeRef == kSecAttrAccessibleAlwaysThisDeviceOnly) {
        return KKKeychainItemAccessibleAlwaysThisDeviceOnly;
    } else if (typeRef == kSecAttrAccessibleAfterFirstUnlock) {
        return KKKeychainItemAccessibleAfterFirstUnlock;
    } else if (typeRef == kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly) {
        return KKKeychainItemAccessibleAfterFirstUnlockThisDeviceOnly;
    } else if (typeRef == kSecAttrAccessibleWhenUnlocked) {
        return KKKeychainItemAccessibleWhenUnlocked;
    } else if (typeRef == kSecAttrAccessibleWhenUnlockedThisDeviceOnly) {
        return KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly;
    } else { // typeRef == kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        return KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly;
    }
}

@end
