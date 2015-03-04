//
//  KKKeychainPasswordBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import "KKKeychainPasswordBuilder.h"
#import "KKKeychainItemBuilder+SubclassesInterface.h"

@implementation KKKeychainPasswordBuilder

#pragma mark - Building

- (id)buildKeychainItem {
    return nil; // client is not allowed to create incomplete object
}

#pragma mark - KKKeychainItemBuilder Subclasses interface

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary {
    [super setPropertiesFromDictionary:dictionary];
    
    NSDate *creationDate = [dictionary objectForKey:(__bridge id)kSecAttrCreationDate];
    if (creationDate) {
        self.creationDate = creationDate;
    }
    NSDate *modificationDate = [dictionary objectForKey:(__bridge id)kSecAttrModificationDate];
    if (modificationDate) {
        self.modificationDate = modificationDate;
    }
    NSString *itemDescription = [dictionary objectForKey:(__bridge id)kSecAttrDescription];
    if (itemDescription) {
        self.itemDescription = itemDescription;
    }
    NSString *comment = [dictionary objectForKey:(__bridge id)kSecAttrComment];
    if (comment) {
        self.comment = comment;
    }
    NSNumber *creator = [dictionary objectForKey:(__bridge id)kSecAttrCreator];
    if (creator) {
        self.creator = creator;
    }
    NSNumber *type = [dictionary objectForKey:(__bridge id)kSecAttrType];
    if (type) {
        self.type = type;
    }
    NSNumber *isInvisibleNumber = [dictionary objectForKey:(__bridge id)kSecAttrIsInvisible];
    if (isInvisibleNumber) {
        self.invisible = [isInvisibleNumber boolValue];
    }
    NSNumber *isNegativeNumber = [dictionary objectForKey:(__bridge id)kSecAttrIsNegative];
    if (isNegativeNumber) {
        self.negative = [isNegativeNumber boolValue];
    }
    NSString *account = [dictionary objectForKey:(__bridge id)kSecAttrAccount];
    if (account) {
        self.account = account;
    }
}

@end
