//
//  KKKeychainPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"
#import "KKKeychainItem_KeychainKitInterface.h"
#import "KKKeychainPassword_KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainPassword ()

@property (nonatomic, strong, readwrite) NSDate                          *creationDate;
@property (nonatomic, strong, readwrite) NSDate                          *modificationDate;
@property (nonatomic, strong, readwrite) NSString                        *itemDescription;
@property (nonatomic, strong, readwrite) NSString                        *comment;
@property (nonatomic, strong, readwrite) NSNumber                        *creator;
@property (nonatomic, strong, readwrite) NSNumber                        *type;
@property (nonatomic, assign, readwrite, getter=isInvisible) BOOL        invisible;
@property (nonatomic, assign, readwrite, getter=isNegative) BOOL         negative;
@property (nonatomic, strong, readwrite) NSString                        *account;

@end

@implementation KKKeychainPassword

#pragma mark - Object Life Cycle

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account {
    self = [super initWithData:data label:label accessGroup:accessGroup];
    
    if (self) {
        [self updateObjectWithCreationDate:creationDate modificationDate:modificationDate
                           itemDescription:itemDescription comment:comment creator:creator type:type
                               isInvisible:isInvisible isNegative:isNegative account:account];
    }
    
    return  self;
}

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                        type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                     account:(NSString *)account accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup accessibility:accessibility];
    
    if (self) {
        [self updateObjectWithCreationDate:creationDate modificationDate:modificationDate
                           itemDescription:itemDescription comment:comment creator:creator type:type
                               isInvisible:isInvisible isNegative:isNegative account:account];
    }
    
    return self;
}

- (void)updateObjectWithCreationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
                     itemDescription:(NSString *)itemDescription comment:(NSString *)comment creator:(NSNumber *)creator
                                type:(NSNumber *)type isInvisible:(BOOL)isInvisible isNegative:(BOOL)isNegative
                             account:(NSString *)account {
    self.creationDate = creationDate;
    self.modificationDate = modificationDate;
    self.itemDescription = itemDescription;
    self.comment = comment;
    self.creator = creator;
    self.type = type;
    self.invisible = isInvisible;
    self.negative = isNegative;
    self.account = account;
}

#pragma mark - Keychain mapping

- (void)updateItemWithAttributes:(NSDictionary *)attributes {
    [super updateItemWithAttributes:attributes];
    NSDate *creationDate = [attributes objectForKey:(__bridge id)kSecAttrCreationDate];
    if (creationDate) {
        self.creationDate = creationDate;
    }
    NSDate *modificationDate = [attributes objectForKey:(__bridge id)kSecAttrModificationDate];
    if (modificationDate) {
        self.modificationDate = modificationDate;
    }
    NSString *itemDescription = [attributes objectForKey:(__bridge id)kSecAttrDescription];
    if (itemDescription) {
        self.itemDescription = itemDescription;
    }
    NSString *comment = [attributes objectForKey:(__bridge id)kSecAttrComment];
    if (comment) {
        self.comment = comment;
    }
    NSNumber *creator = [attributes objectForKey:(__bridge id)kSecAttrCreator];
    if (creator) {
        self.creator = creator;
    }
    NSNumber *type = [attributes objectForKey:(__bridge id)kSecAttrType];
    if (type) {
        self.type = type;
    }
    NSNumber *isInvisibleNumber = [attributes objectForKey:(__bridge id)kSecAttrIsInvisible];
    if (isInvisibleNumber) {
        self.invisible = [isInvisibleNumber boolValue];
    }
    NSNumber *isNegativeNumber = [attributes objectForKey:(__bridge id)kSecAttrIsNegative];
    if (isNegativeNumber) {
        self.negative = [isNegativeNumber boolValue];
    }
    NSString *account = [attributes objectForKey:(__bridge id)kSecAttrAccount];
    if (account) {
        self.account = account;
    }
}

- (NSDictionary *)keychainAttributesWithError:(NSError **)error {
    NSDictionary *attributes = [super keychainAttributesWithError:error];
    if (attributes) {
        NSMutableDictionary *mutableAttributes = [[NSMutableDictionary alloc] initWithDictionary:attributes];
        [mutableAttributes setObjectSafely:self.creationDate
                                    forKey:(__bridge id)kSecAttrCreationDate];
        [mutableAttributes setObjectSafely:self.modificationDate
                                    forKey:(__bridge id)kSecAttrModificationDate];
        [mutableAttributes setObjectSafely:self.itemDescription
                                    forKey:(__bridge id)kSecAttrDescription];
        [mutableAttributes setObjectSafely:self.comment
                                    forKey:(__bridge id)kSecAttrComment];
        [mutableAttributes setObjectSafely:self.creator
                                    forKey:(__bridge id)kSecAttrCreator];
        [mutableAttributes setObjectSafely:self.type
                                    forKey:(__bridge id)kSecAttrType];
        [mutableAttributes setObjectSafely:@([self isInvisible])
                                    forKey:(__bridge id)kSecAttrIsInvisible];
        [mutableAttributes setObjectSafely:@([self isNegative])
                                    forKey:(__bridge id)kSecAttrIsNegative];
        [mutableAttributes setObjectSafely:self.account
                                    forKey:(__bridge id)kSecAttrAccount];
        attributes = [mutableAttributes copy]; // get an immutable copy
    }
    return attributes;
}

@end
