//
//  KKKeychainGenericPassword.m
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import <Security/Security.h>
#import "KKKeychainGenericPassword.h"
#import "KKKeychainItem+SuclassesInterface.h"
#import "KKKeychainPassword+SuclassesInterface.h"
#import "KKKeychainItem+KeychainKitInterface.h"
#import "NSMutableDictionary+KeychainKit.h"

@interface KKKeychainGenericPassword ()

@property (nonatomic, copy, readwrite) NSString *service;
@property (nonatomic, copy, readwrite) NSData *generic;

@end

@implementation KKKeychainGenericPassword

#pragma mark - Object Life Cycle

- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment
                     creator:(NSNumber *)creator type:(NSNumber *)type isInvisible:(BOOL)isInvisible
                  isNegative:(BOOL)isNegative account:(NSString *)account service:(NSString *)service
                     generic:(NSData *)generic accessibility:(KKKeychainItemAccessibility)accessibility {
    self = [super initWithData:data label:label accessGroup:accessGroup creationDate:creationDate
              modificationDate:modificationDate itemDescription:itemDescription comment:comment
                       creator:creator type:type isInvisible:isInvisible isNegative:isNegative account:account
                 accessibility:accessibility];
    
    if (self) {
        self.service = service;
        self.generic = generic;
    }
    
    return self;
}

#pragma mark - Item Conversion

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
