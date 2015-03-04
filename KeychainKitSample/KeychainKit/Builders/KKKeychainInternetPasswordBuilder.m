//
//  KKKeychainInternetPasswordBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import "KKKeychainInternetPasswordBuilder.h"
#import "KKKeychainItemBuilder+KeychainKitInterface.h"
#import "KKKeychainItemBuilder+SubclassesInterface.h"
#import "KKKeychainInternetPassword.h"

@implementation KKKeychainInternetPasswordBuilder

#pragma mark - Building

- (id)buildKeychainItem {
    return [[KKKeychainInternetPassword alloc] initWithData:self.data label:self.label
                                                accessGroup:self.accessGroup
                                               creationDate:self.creationDate
                                           modificationDate:self.modificationDate
                                            itemDescription:self.itemDescription comment:self.comment
                                                    creator:self.creator
                                                       type:self.type isInvisible:self.isInvisible
                                                 isNegative:self.isNegative
                                                    account:self.account securityDomain:self.securityDomain
                                                     server:self.server
                                                   protocol:self.protocol
                                         authenticationType:self.authenticationType
                                                       port:self.port path:self.path
                                              accessibility:self.accessibility];
}

- (id)buildKeychainItemFromDictionary:(NSDictionary *)dictionary {
    [self setPropertiesFromDictionary:dictionary];
    return [self buildKeychainItem];
}

#pragma mark - KKKeychainItemBuilder Subclasses interface

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary {
    [super setPropertiesFromDictionary:dictionary];
    
    NSString *securityDomain = [dictionary objectForKey:(__bridge id)kSecAttrSecurityDomain];
    if (securityDomain) {
        self.securityDomain = securityDomain;
    }
    NSString *server = [dictionary objectForKey:(__bridge id)kSecAttrServer];
    if (server) {
        self.server = server;
    }
    NSNumber *port = [dictionary objectForKey:(__bridge id)kSecAttrPort];
    if (port) {
        self.port = port;
    }
    NSString *path = [dictionary objectForKey:(__bridge id)kSecAttrPath];
    if (path) {
        self.path = path;
    }
#warning Needs to set protocol. To be added later on.
#warning Although this depends on architecture changes that will come.
}

@end
