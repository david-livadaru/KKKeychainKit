//
//  KKKeychainSampleDataModel.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleDataModel.h"

@interface KKKeychainSampleDataModel ()

@property (nonatomic, assign, readwrite) KKKeychainOperationType operationType;
@property (nonatomic, assign, readwrite) KKKeychainSampleDataType dataType;

@end

@implementation KKKeychainSampleDataModel

#pragma mark - Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                             dataType:(KKKeychainSampleDataType)dataType {
    self = [super init];
    
    if (self) {
        self.operationType = operationType;
        self.dataType = dataType;
    }
    
    return self;
}

@end
