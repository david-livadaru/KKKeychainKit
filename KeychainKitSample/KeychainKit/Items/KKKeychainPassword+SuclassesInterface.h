//
//  KKKeychainPassword_KeychainKitInterface.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import "KKKeychainPassword.h"

@interface KKKeychainPassword ()

/*!
 *  Initiazes a Keychain Item using provided parameters.
 *
 *  @return An initialized object, or nil if an object could not be created for some
 *          reason that would not result in an exception.
 */
- (instancetype)initWithData:(NSData *)data label:(NSString *)label accessGroup:(NSString *)accessGroup
                creationDate:(NSDate *)creationDate modificationDate:(NSDate *)modificationDate
             itemDescription:(NSString *)itemDescription comment:(NSString *)comment
                     creator:(NSNumber *)creator type:(NSNumber *)type isInvisible:(BOOL)isInvisible
                  isNegative:(BOOL)isNegative account:(NSString *)account
               accessibility:(KKKeychainItemAccessibility)accessibility;

@end
