//
//  KKKeychainRequest.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainOperation.h"

@interface KKKeychainOperation ()

@property (nonatomic, assign, readwrite) KKKeychainOperationType    operationType;
@property (nonatomic, strong, readwrite) KKKeychainItem             *item;

@end

@implementation KKKeychainOperation

#pragma mark - Object Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item {
    self = [super init];
    
    if (self) {
        self.operationType = operationType;
        self.item = item;
    }
    
    return self;
}

@end
