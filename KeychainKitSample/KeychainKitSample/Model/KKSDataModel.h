//
//  KKKeychainSampleDataModel.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
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

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                             dataType:(KKSDataType)dataType;

@end
