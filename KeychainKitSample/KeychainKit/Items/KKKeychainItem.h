//
//  KKKeychainItem.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KeychainKit/KKeychainItemTypes.h>

@interface KKKeychainItem : NSObject

@property (nonatomic, copy, readonly) NSData *data;
@property (nonatomic, copy, readonly) NSString *label;
@property (nonatomic, copy, readonly) NSString *accessGroup;
@property (nonatomic, assign, readonly) KKKeychainItemAccessibility accessbility;

@end
