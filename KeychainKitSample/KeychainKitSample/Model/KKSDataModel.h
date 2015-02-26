//
//  KKKeychainSampleDataModel.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

@import KeychainKit;
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KKSDataType) {
    KKKeychainSampleDataTypeAccount = 1,
    KKKeychainSampleDataTypeString,
    KKKeychainSampleDataTypeDictionary,
    KKKeychainSampleDataTypeImage
};

@interface KKSDataModel : NSObject

@property (nonatomic, assign, readonly) KKKeychainOperationType operationType;
@property (nonatomic, assign, readonly) KKSDataType dataType;

// Life Cycle
- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                             dataType:(KKSDataType)dataType;

@end
