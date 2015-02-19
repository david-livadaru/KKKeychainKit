//
//  KKeychainSampleModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleModelDataConverter.h"
#import "KKKeychainSampleStringModelDataConverter.h"
#import "KKKeychainSampleDictionaryModelDataConverter.h"
#import "KKKeychainSampleImageModelDataConverter.h"

@implementation KKKeychainSampleModelDataConverter

+ (instancetype)dataConverterForDataType:(KKKeychainSampleDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeString:
        case KKKeychainSampleDataTypeAccount:
            return [[KKKeychainSampleStringModelDataConverter alloc] init];
        case KKKeychainSampleDataTypeDictionary:
            return [[KKKeychainSampleDictionaryModelDataConverter alloc] init];
        case KKKeychainSampleDataTypeImage:
            return [[KKKeychainSampleImageModelDataConverter alloc] init];
        default:
            return nil;
    }
}

- (NSData *)dataFromModel:(id)model {
    return nil;
}

- (id)modelFromData:(NSData *)data {
    return nil;
}

@end
