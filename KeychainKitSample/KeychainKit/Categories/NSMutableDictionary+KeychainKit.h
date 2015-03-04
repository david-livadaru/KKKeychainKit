//
//  NSMutableDictionary+KeychainKit.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (KeychainKit)

- (void)setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey;

@end
