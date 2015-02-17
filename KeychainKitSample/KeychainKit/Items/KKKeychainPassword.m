//
//  KKKeychainPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainPassword.h"
@import Security;
#import "KKKeychainItem+SuclassesInterface.h"
#import "KKKeychainPassword+SuclassesInterface.h"
#import "KKKeychainItem+KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainPassword ()

/*!
 *  @abstract
 *      Represents the date the item was created.
 */
@property (nonatomic, strong, readwrite) NSDate *creationDate;
/*!
 *  @abstract
 *      Represents the last time the item was updated.
 */
@property (nonatomic, strong, readwrite) NSDate *modificationDate;
/*!
 *  @abstract
 *      Apecifies a user-visible string describing this kind of item 
 *      (Examples:"Disk image password"; "Login credentials."; 
 *       "An object which represent serialization of this class").
 */
@property (nonatomic, strong, readwrite) NSString *itemDescription;
/*!
 *  @abstract
 *      Contains the user-editable comment for this item.
 */
@property (nonatomic, strong, readwrite) NSString *comment;
/*!
 *  @abstract
 *      Represents the item's creator. This number is the unsigned integer
 *      representation of a four-character code (for example, 'aCrt').
 */
@property (nonatomic, strong, readwrite) NSNumber *creator;
/*!
 *  @abstract
 *      Tepresents the item's type. This number is the unsigned integer 
 *      representation of a four-character code (for example, 'aTyp').
 */
@property (nonatomic, strong, readwrite) NSNumber *type;
/*!
 *  @abstract
 *      Boolean value which specifies if the item is invisible (that is, should not be displayed).
 */
@property (nonatomic, assign, readwrite, getter=isInvisible) BOOL invisible;
/*!
 *  @abstract
 *      Boolean values which indicates whether there is a valid password associated with this keychain item.
 *
 *  @discussion
 *      This is useful if your application doesn't want a password for some particular service to be stored 
 *      in the keychain, but prefers that it always be entered by the user
 */
@property (nonatomic, assign, readwrite, getter=isNegative) BOOL negative;
/*!
 *  @abstract
 *      Contains an account name.
 */
@property (nonatomic, strong, readwrite) NSString *account;

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
                     account:(NSString *)account accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup accessibility:accessibility];
    
    if (self) {
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
    
    return self;
}

#pragma mark - Item Conversion

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
