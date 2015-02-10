//
//  KKKeychainItemBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KeychainKit/KKeychainItemTypes.h>

@interface KKKeychainItemBuilder : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *accessGroup;
@property (nonatomic, assign) KKKeychainItemAccessibility accessbility NS_AVAILABLE_IOS(8_0);

// Building
- (id)buildKeychainItem;

@end
