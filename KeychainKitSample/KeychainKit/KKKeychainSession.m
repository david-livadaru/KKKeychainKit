//
//  KKKeychainSession.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainSession.h"
#import "KKKeychainSession+KeychainKitInterface.h"
#import "KKKeychainOperation.h"
#import "KKKeychainOperation+KeychainKitInteface.h"
#import "KKKeychainGenericPassword.h"
#import "KKKeychainGenericPasswordBuilder.h"

@interface KKKeychainSession ()

@property (nonatomic, strong, readwrite) NSString *appID;

@end

@implementation KKKeychainSession

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self getAppID];
    }
    
    return self;
}

#pragma mark - Facilities

- (void)performOperation:(KKKeychainOperation *)operation
         completionBlock:(void (^)(NSArray *items, NSError *error))completionBlock {
    [operation executeWithCompletionBlock:completionBlock];
}

- (void)getAppID {
    __block KKKeychainGenericPassword *addedGenericPassword = nil;
    __weak typeof(self) weakSelf = self;
    [self addDummyItemWithCompletionBlock:^(NSArray *items, NSError *error) {
        addedGenericPassword = [items firstObject];
        [weakSelf getAppIDFromAccessGroup:addedGenericPassword.accessGroup];
    }];
    [self deleteDummyItem:addedGenericPassword];
}

- (void)addDummyItemWithCompletionBlock:(void (^)(NSArray *items, NSError *error))completionBlock {
    KKKeychainGenericPasswordBuilder *genericPasswordBuilder =
    [[KKKeychainGenericPasswordBuilder alloc] initWithKeychainSession:self];
    genericPasswordBuilder.service = @"org.KeychainKit.KKKeychainSession";
    genericPasswordBuilder.label = @"org.KeychainKit.DummyItem.Label";
    NSString *stringData = @"Keychain dummy data";
    genericPasswordBuilder.data = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    KKKeychainGenericPassword *genericPassword = [genericPasswordBuilder buildKeychainItem];
    KKKeychainOperation *addOperation = [KKKeychainOperation operationWithType:KKKeychainOperationTypeAdd
                                                                          item:genericPassword];
    [self performOperation:addOperation completionBlock:completionBlock];
}

- (void)getAppIDFromAccessGroup:(NSString *)accessGroup {
    NSRange rangeOfDot = [accessGroup rangeOfString:@"."];
    if (rangeOfDot.location != NSNotFound) {
        self.appID = [accessGroup substringToIndex:rangeOfDot.location];
    }
}

- (void)deleteDummyItem:(KKKeychainGenericPassword *)dummyItem {
    KKKeychainOperation *deleteOperation = [KKKeychainOperation operationWithType:KKKeychainOperationTypeDelete
                                                                             item:dummyItem];
    [self performOperation:deleteOperation completionBlock:nil];
}

@end
