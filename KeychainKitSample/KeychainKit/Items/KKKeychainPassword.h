//
//  KKKeychainPassword.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainItem.h"

@interface KKKeychainPassword : KKKeychainItem

@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSDate *modificationDate;
@property (nonatomic, strong, readonly) NSString *itemDescription;
@property (nonatomic, strong, readonly) NSString *comment;
@property (nonatomic, strong, readonly) NSNumber *creator;
@property (nonatomic, strong, readonly) NSNumber *type;
@property (nonatomic, assign, readonly, getter=isInvisible) BOOL invisible;
@property (nonatomic, assign, readonly, getter=isNegative) BOOL negative;
@property (nonatomic, strong, readonly) NSString *account;

@end
