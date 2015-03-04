//
//  KKKeychainSession+KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//

#import <KeychainKit/KeychainKit.h>

@interface KKKeychainSession (KeychainKitInterface)

@property (nonatomic, strong, readonly) NSString *appID;

@end
