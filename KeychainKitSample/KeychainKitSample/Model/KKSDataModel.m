//
//  KKKeychainSampleDataModel.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
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
