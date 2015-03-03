//
//  KKKeychainGenericPasswordBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import "KKKeychainPasswordBuilder.h"

@interface KKKeychainGenericPasswordBuilder : KKKeychainPasswordBuilder

@property (nonatomic, strong) NSString *service;
@property (nonatomic, strong) NSData *generic;

@end
