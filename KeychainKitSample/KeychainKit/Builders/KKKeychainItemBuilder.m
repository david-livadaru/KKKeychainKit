//
//  KKKeychainItemBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainItemBuilder.h"
#import "KKKeychainItemBuilder+KeychainKitInterface.h"
#import "KKKeychainItemBuilder+SubclassesInterface.h"
#import "KKKeychainSession.h"
#import "KKKeychainSession+KeychainKitInterface.h"

@interface KKKeychainItemBuilder ()

@property (nonatomic, strong) KKKeychainSession *keychainSession;

@end

@implementation KKKeychainItemBuilder

#pragma mark - Life Cycle

- (instancetype)initWithKeychainSession:(KKKeychainSession *)keychainSession {
    self = [super init];
    
    if (self) {
        self.keychainSession = keychainSession;
        self.accessbility = KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly;
    }
    
    return self;
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

#warning pragma required

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
#warning get accesbility from SecAccessControlRef or kSecAttrAccessible depending on iOS version
}

@end
