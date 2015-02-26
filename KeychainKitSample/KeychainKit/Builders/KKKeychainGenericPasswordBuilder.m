//
//  KKKeychainGenericPasswordBuilder.m
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainGenericPasswordBuilder.h"
#import "KKKeychainGenericPassword.h"

@implementation KKKeychainGenericPasswordBuilder

#pragma mark - Building

- (id)buildKeychainItem {
    return [[KKKeychainGenericPassword alloc] initWithData:self.data label:self.label accessGroup:self.accessGroup
                                              creationDate:self.creationDate modificationDate:self.modificationDate
                                           itemDescription:self.itemDescription comment:self.comment creator:self.creator
                                                      type:self.type isInvisible:self.isInvisible isNegative:self.isNegative
                                                   account:self.account service:self.service generic:self.generic
                                             accessibility:self.accessbility];
}

@end
