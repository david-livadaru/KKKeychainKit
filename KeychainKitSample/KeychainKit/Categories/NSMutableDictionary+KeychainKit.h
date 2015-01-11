//
//  NSMutableDictionary+KeychainKit.h
//  KeychainKitSample
//
//  Created by david on 11/01/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (KeychainKit)

- (void)setObjectSafely:(id)anObject forKey:(id<NSCopying>)aKey;

@end
