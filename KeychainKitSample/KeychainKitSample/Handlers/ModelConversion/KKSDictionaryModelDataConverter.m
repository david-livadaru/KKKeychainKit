//
//  KKeychainSampleDictionaryModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//

#import "KKSDictionaryModelDataConverter.h"

@implementation KKSDictionaryModelDataConverter

#pragma mark - KKKeychainSample Model Data Converter Override

- (NSData *)dataFromModel:(id)model {
    return [NSKeyedArchiver archivedDataWithRootObject:model];
}

- (id)modelFromData:(NSData *)data {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
