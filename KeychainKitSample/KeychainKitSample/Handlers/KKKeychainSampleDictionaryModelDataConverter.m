//
//  KKeychainSampleDictionaryModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleDictionaryModelDataConverter.h"

@implementation KKKeychainSampleDictionaryModelDataConverter

#pragma mark - KKKeychainSample Model Data Converter Override

- (NSData *)dataFromModel:(id)model {
    return [NSKeyedArchiver archivedDataWithRootObject:model];
}

- (id)modelFromData:(NSData *)data {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
