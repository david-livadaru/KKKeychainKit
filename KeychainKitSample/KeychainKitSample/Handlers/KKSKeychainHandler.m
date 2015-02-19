//
//  KKSKeychainHandler.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKSKeychainHandler.h"

@interface KKSKeychainHandler ()

@property (nonatomic, strong) KKKeychainSession *keychainSession;
@property (nonatomic, assign) KKKeychainOperationType operationType;
@property (nonatomic, weak) id<KKKeychainSampleItemDataVisualizer> dataVisualizer;

@end

@implementation KKSKeychainHandler

#pragma mark - Object Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                       dataVisualizer:(id<KKKeychainSampleItemDataVisualizer>)dataVisualizer {
    self = [super init];
    
    if (self) {
        self.operationType = operationType;
        self.dataVisualizer = dataVisualizer;
        self.keychainSession = [[KKKeychainSession alloc] init];
    }
    
    return self;
}

#pragma mark - Operations

- (void)performKeychainOperation {
}

//- (void)addStringInKeychain:(NSString *)string key:(NSString *)key {
//    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    // service name delete: @"Keychain Kit Sample"
//    KKKeychainItem *stringItem =
//    [[KKKeychainItem alloc] initWithData:stringData serviceName:key accessibility:KKKeychainItemAccessibleWhenPasscodeSetThisDeviceOnly];
//    KKKeychainOperation *addOperation =
//    [[KKKeychainOperation alloc] initWithOperationType:KKKeychainOperationTypeAdd
//                                                  item:stringItem];
//    [self.keychainSession performOperation:addOperation completion:^(NSArray *items, NSError *error) {
//        if (error) {
//            NSLog(@"Failed to add item in keychain. Reason:%@", [error localizedDescription]);
//        }
//    }];
//}

@end
