//
//  KKSDictionaryPair.h
//  KeychainKitSample
//
//  Created by david on 26/02/15.
//

#import <Foundation/Foundation.h>

@interface KKSDictionaryPair : NSObject

@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) NSString *object;

- (instancetype)initWithKey:(NSString *)key object:(NSString *)object;

@end
