//
//  KKKeychainRequest.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KKKeychainOperationType) {
    KKKeychainOperationTypeAdd = 1,
    KKKeychainOperationTypeUpdate,
    KKKeychainOperationTypeDelete,
    KKKeychainOperationTypeSearch
};

@class KKKeychainItem;

@interface KKKeychainOperation : NSObject

@property (nonatomic, assign, readonly) KKKeychainOperationType     operationType;
@property (nonatomic, strong, readonly) KKKeychainItem              *item;

// Object Life Cycle
+ (instancetype)operationWithType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item;

@end
