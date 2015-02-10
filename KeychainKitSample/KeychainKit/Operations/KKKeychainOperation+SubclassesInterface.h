//
//  KKKeychainOperation+SubclassesInterface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <KeychainKit/KeychainKit.h>
@import Security;

@interface KKKeychainOperation (SubclassesInterface)

// Execution
- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result;

@end
