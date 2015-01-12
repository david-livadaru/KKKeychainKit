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

/*!
 *  @abstract
 *      Represents the date the item was created.
 */
@property (nonatomic, strong, readwrite) NSDate                          *creationDate;
/*!
 *  @abstract
 *      Represents the last time the item was updated.
 */
@property (nonatomic, strong, readwrite) NSDate                          *modificationDate;
/*!
 *  @abstract
 *      Apecifies a user-visible string describing this kind of item 
 *      (Examples:"Disk image password"; "Login credentials."; 
 *       "An object which represent serialization of this class").
 */
@property (nonatomic, strong, readwrite) NSString                        *itemDescription;
/*!
 *  @abstract
 *      Contains the user-editable comment for this item.
 */
@property (nonatomic, strong, readwrite) NSString                        *comment;
/*!
 *  @abstract
 *      Represents the item's creator. This number is the unsigned integer
 *      representation of a four-character code (for example, 'aCrt').
 */
@property (nonatomic, strong, readwrite) NSNumber                        *creator;
/*!
 *  @abstract
 *      Tepresents the item's type. This number is the unsigned integer 
 *      representation of a four-character code (for example, 'aTyp').
 */
@property (nonatomic, strong, readwrite) NSNumber                        *type;
/*!
 *  @abstract
 *      Boolean value which specifies if the item is invisible (that is, should not be displayed).
 */
@property (nonatomic, assign, readwrite, getter=isInvisible) BOOL        invisible;
/*!
 *  @abstract
 *      Boolean values which indicates whether there is a valid password associated with this keychain item.
 *
 *  @discussion
 *      This is useful if your application doesn't want a password for some particular service to be stored 
 *      in the keychain, but prefers that it always be entered by the user
 */
@property (nonatomic, assign, readwrite, getter=isNegative) BOOL         negative;
/*!
 *  @abstract
 *      Contains an account name.
 */
@property (nonatomic, strong, readwrite) NSString                        *account;

@end

@implementation KKKeychainPassword

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
                     account:(NSString *)account {
    self = [super initWithData:data label:label accessGroup:accessGroup];
    
    if (self) {
        [self updateObjectWithCreationDate:creationDate modificationDate:modificationDate
                           itemDescription:itemDescription comment:comment creator:creator type:type
                               isInvisible:isInvisible isNegative:isNegative account:account];
    }
    
    return  self;
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
                     account:(NSString *)account accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup accessibility:accessibility];
    
    if (self) {
        [self updateObjectWithCreationDate:creationDate modificationDate:modificationDate
                           itemDescription:itemDescription comment:comment creator:creator type:type
                               isInvisible:isInvisible isNegative:isNegative account:account];
    }
    
    return self;
}

/*!
 *  Continues object's common initialization using provided parameters.
 */
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
