//
//  KKSDictionaryPair.m
//  KeychainKitSample
//
//  Created by david on 26/02/15.
//

#import "KKSDictionaryPair.h"

@interface KKSDictionaryPair ()

@property (nonatomic, copy, readwrite) NSString *key;
@property (nonatomic, copy, readwrite) NSString *object;

@end

@implementation KKSDictionaryPair

#pragma mark - Life Cycle

- (instancetype)initWithKey:(NSString *)key object:(NSString *)object {
    self = [super init];
    
    if (self) {
        self.key = key;
        self.object = object;
    }
    
    return self;
}

@end
