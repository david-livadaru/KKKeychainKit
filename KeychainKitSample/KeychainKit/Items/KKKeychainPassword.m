//
//  KKKeychainPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainPassword.h"
@import Security;
#import "KKKeychainItem+SuclassesInterface.h"
#import "KKKeychainPassword+SuclassesInterface.h"
#import "KKKeychainItem+KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainPassword ()

@property (nonatomic, readwrite) NSDate *creationDate;
@property (nonatomic, readwrite) NSDate *modificationDate;
@property (nonatomic, copy, readwrite) NSString *itemDescription;
@property (nonatomic, copy, readwrite) NSString *comment;
@property (nonatomic, readwrite) NSNumber *creator;
@property (nonatomic, readwrite) NSNumber *type;
@property (nonatomic, assign, readwrite, getter=isInvisible) BOOL invisible;
@property (nonatomic, assign, readwrite, getter=isNegative) BOOL negative;
@property (nonatomic, copy, readwrite) NSString *account;

@end

@implementation KKKeychainPassword

#pragma mark - Object Life Cycle

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment
                     creator:(NSNumber *)creator type:(NSNumber *)type isInvisible:(BOOL)isInvisible
                  isNegative:(BOOL)isNegative account:(NSString *)account
               accessibility:(KKKeychainItemAccessibility)accessibility {
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
