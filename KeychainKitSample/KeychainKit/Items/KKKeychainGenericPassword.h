//
//  KKKeychainGenericPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"

@interface KKKeychainGenericPassword : KKKeychainPassword

@property (nonatomic, strong, readonly) NSString        *service;
@property (nonatomic, strong, readonly) NSData          *generic;

// Object Life Cycle
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account service:(NSString *)service generic:(NSData *)generic
               accessibility:(KKKeychainItemAccessibility)accessibility;
- (instancetype)initWithData:(NSData *)data accessGroup:(NSString *)accessGroup
             itemDescription:(NSString *)itemDescription account:(NSString *)account service:(NSString *)service
                     generic:(NSData *)generic
               accessibility:(KKKeychainItemAccessibility)accessibility;

@end
