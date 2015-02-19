//
//  KKKeychainSampleStringModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleStringModelDataConverter.h"

@implementation KKKeychainSampleStringModelDataConverter

#pragma mark - KKKeychainSample Model Data Converter Override

- (NSData *)dataFromModel:(id)model {
    NSString *stringModel = model;
    return [stringModel dataUsingEncoding:NSUTF8StringEncoding];
}

- (id)modelFromData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
