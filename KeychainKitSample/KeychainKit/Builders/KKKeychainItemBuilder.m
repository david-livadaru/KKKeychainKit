//
//  KKKeychainItemBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainItemBuilder.h"
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

@end
