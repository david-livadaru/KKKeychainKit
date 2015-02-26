//
//  KKKeychainSampleDataModel.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSDataModel.h"

@interface KKSDataModel ()

@property (nonatomic, assign, readwrite) KKKeychainOperationType operationType;
@property (nonatomic, assign, readwrite) KKSDataType dataType;

@end

@implementation KKSDataModel

#pragma mark - Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                             dataType:(KKSDataType)dataType {
    self = [super init];
    
    if (self) {
        self.operationType = operationType;
        self.dataType = dataType;
    }
    
    return self;
}

@end
