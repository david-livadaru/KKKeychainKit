//
//  KKKeychainGenericPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainGenericPassword.h"
#import "KKKeychainItem_KeychainKitInterface.h"
#import "KKKeychainPassword_KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainGenericPassword ()

/*!
 *  @abstract
 *      A string that represents the service associated with this item.
 *      (Exmaple: "com.apple.iDevice.PasscodeScreen")
 */
@property (nonatomic, strong, readwrite) NSString        *service;
/*!
 *  @abstract
 *      Contains a user-defined attribute.
 */
@property (nonatomic, strong, readwrite) NSData          *generic;

@end

@implementation KKKeychainGenericPassword

#pragma mark - Object Life Cycle

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account service:(NSString *)service generic:(NSData *)generic {
    self = [super initWithData:data label:label accessGroup:accessGroup creationDate:creationDate
              modificationDate:modificationDate itemDescription:itemDescription comment:comment creator:creator
                          type:type isInvisible:isInvisible isNegative:isNegative account:account];
    
    if (self) {
        [self updateObjectWithService:service generic:generic];
    }
    
    return self;
}

/*!
 *  Convenien method to initialize a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data accessGroup:(NSString *)accessGroup
             itemDescription:(NSString *)itemDescription account:(NSString *)account service:(NSString *)service
                     generic:(NSData *)generic {
    self = [self initWithData:data label:nil accessGroup:accessGroup creationDate:nil modificationDate:nil
              itemDescription:itemDescription comment:nil creator:nil type:nil isInvisible:NO isNegative:NO
                      account:account service:service generic:generic];
    return self;
}

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account service:(NSString *)service generic:(NSData *)generic
               accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup creationDate:creationDate
              modificationDate:modificationDate itemDescription:itemDescription comment:comment creator:creator
                          type:type isInvisible:isInvisible isNegative:isNegative account:account
                 accessibility:accessibility];
    
    if (self) {
        [self updateObjectWithService:service generic:generic];
    }
    
    return self;
}

/*!
 *  Convenien method to initialize a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data accessGroup:(NSString *)accessGroup
             itemDescription:(NSString *)itemDescription account:(NSString *)account service:(NSString *)service
                     generic:(NSData *)generic
               accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [self initWithData:data label:nil accessGroup:accessGroup creationDate:nil modificationDate:nil
              itemDescription:itemDescription comment:nil creator:nil type:nil isInvisible:NO isNegative:NO
                      account:account service:service generic:generic accessibility:accessibility];
    return self;
}

/*!
 *  Continues object's common initialization using provided parameters.
 */
- (void)updateObjectWithService:(NSString *)service generic:(NSData *)generic {
    self.service = service;
    self.generic = generic;
}

#pragma mark - Keychain mapping

- (void)updateItemWithAttributes:(NSDictionary *)attributes {
    NSString *service = [attributes objectForKey:(__bridge id)kSecAttrService];
    if (service) {
        self.service = service;
    }
    NSData *generic = [attributes objectForKey:(__bridge id)kSecAttrGeneric];
    if (generic) {
        self.generic = generic;
    }
}

- (NSDictionary *)keychainAttributesWithError:(NSError **)error {
    NSDictionary *attributes = [super keychainAttributesWithError:error];
    if (attributes) {
        NSMutableDictionary *mutableAttributes = [[NSMutableDictionary alloc] initWithDictionary:attributes];
        [mutableAttributes setObjectSafely:(__bridge id)kSecClassGenericPassword
                                    forKey:(__bridge id)kSecClass];
        [mutableAttributes setObjectSafely:self.service
                                    forKey:(__bridge id)kSecAttrService];
        [mutableAttributes setObjectSafely:self.generic
                                    forKey:(__bridge id)kSecAttrGeneric];
        attributes = [mutableAttributes copy];
    }
    return attributes;
}

@end
