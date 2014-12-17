//
//  KKKeychainRequest.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KKKeychainRequestOperationType) {
    KKKeychainRequestOperationTypeAdd = 1,
    KKKeychainRequestOperationTypeUpdate,
    KKKeychainRequestOperationTypeDelete,
    KKKeychainRequestOperationTypeSearch
};

@interface KKKeychainRequest : NSObject

@property (nonatomic, assign) KKKeychainRequestOperationType    operationType;

- (instancetype)initWithOperationType:(KKKeychainRequestOperationType)operationType NS_DESIGNATED_INITIALIZER;

@end
