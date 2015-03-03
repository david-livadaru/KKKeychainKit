//
//  KKKeychainSearchOperation.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import "KKKeychainOperation.h"

typedef NS_ENUM(NSUInteger, KKKeychainSearchLimit) {
    KKKeychainSearchLimitOne,
    KKKeychainSearchLimitAll
};

@interface KKKeychainSearchOperation : KKKeychainOperation

@property (nonatomic, assign) KKKeychainSearchLimit searchLimit; // default is KKKeychainSearchLimitOne

@end
