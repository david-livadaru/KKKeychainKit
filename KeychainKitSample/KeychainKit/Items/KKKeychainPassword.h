//
//  KKKeychainPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainItem.h"

@interface KKKeychainPassword : KKKeychainItem

@property (nonatomic, readonly) NSDate *creationDate;
@property (nonatomic, readonly) NSDate *modificationDate;
@property (nonatomic, copy, readonly) NSString *itemDescription;
@property (nonatomic, copy, readonly) NSString *comment;
@property (nonatomic, readonly) NSNumber *creator;
@property (nonatomic, readonly) NSNumber *type;
@property (nonatomic, assign, readonly, getter=isInvisible) BOOL invisible;
@property (nonatomic, assign, readonly, getter=isNegative) BOOL negative;
@property (nonatomic, copy, readonly) NSString *account;

@end
