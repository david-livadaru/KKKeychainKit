//
//  KKSKeychainHandler.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKSKeychainHandler : NSObject

// Operations
- (void)addStringInKeychain:(NSString *)string key:(NSString *)key;

@end
