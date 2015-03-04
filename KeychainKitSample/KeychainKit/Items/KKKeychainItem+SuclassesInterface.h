//
//  KKKeychainItem_KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainItem.h"

@interface KKKeychainItem (SuclassesInterface)

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data
                       label:(NSString *)label
                 accessGroup:(NSString *)accessGroup
               accessibility:(KKKeychainItemAccessibility)accessibility;

@end
