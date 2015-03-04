//
//  KKKeychainItemBuilder.h
//  KeychainKitSample
//
//  Created by david on 11/02/15.
//

#import <Foundation/Foundation.h>
#import <KeychainKit/KKeychainItemTypes.h>

@class KKKeychainSession;

@interface KKKeychainItemBuilder : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *accessGroup;
@property (nonatomic, assign) KKKeychainItemAccessibility accessibility; // default value is KKKeychainItemAccessibleWhenUnlockedThisDeviceOnly

- (instancetype)initWithKeychainSession:(KKKeychainSession *)keychainSession;

- (id)buildKeychainItem;

@end
