//
//  KKeychainSampleModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSModelDataConverter.h"
#import "KKSStringModelDataConverter.h"
#import "KKSDictionaryModelDataConverter.h"
#import "KKSImageModelDataConverter.h"

@implementation KKSModelDataConverter

+ (instancetype)dataConverterForDataType:(KKSDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeString:
        case KKKeychainSampleDataTypeAccount:
            return [[KKSStringModelDataConverter alloc] init];
        case KKKeychainSampleDataTypeDictionary:
            return [[KKSDictionaryModelDataConverter alloc] init];
        case KKKeychainSampleDataTypeImage:
            return [[KKSImageModelDataConverter alloc] init];
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
