//
//  KKKeychainPasswordBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import "KKKeychainItemBuilder.h"

@interface KKKeychainPasswordBuilder : KKKeychainItemBuilder

@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSDate *modificationDate;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSNumber *creator;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, assign, getter=isInvisible) BOOL invisible;
@property (nonatomic, assign, getter=isNegative) BOOL negative;
@property (nonatomic, strong) NSString *account;

@end
