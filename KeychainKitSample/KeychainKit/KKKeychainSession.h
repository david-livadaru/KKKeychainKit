//
//  KKKeychainSession.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import <Foundation/Foundation.h>

@class KKKeychainOperation;

@interface KKKeychainSession : NSObject

- (void)performOperation:(KKKeychainOperation *)operation
         completionBlock:(void (^)(NSArray *items, NSError *error))completionBlock;

@end
