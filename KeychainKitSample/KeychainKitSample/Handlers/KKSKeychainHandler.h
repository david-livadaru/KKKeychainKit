//
//  KKSKeychainHandler.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

@import KeychainKit;
#import <Foundation/Foundation.h>
#import "KKKeychainSampleItemDataVisualizer.h"

@interface KKSKeychainHandler : NSObject

// Life Cycle
- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType
                       dataVisualizer:(id<KKKeychainSampleItemDataVisualizer>)dataVisualizer;

// Operations
- (void)performKeychainOperation;

@end
