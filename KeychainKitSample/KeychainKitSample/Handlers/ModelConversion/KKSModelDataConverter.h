//
//  KKeychainSampleModelDataConverter.h
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKKeychainSampleDataModel.h"

@interface KKSModelDataConverter : NSObject

+ (instancetype)dataConverterForDataType:(KKKeychainSampleDataType)dataType;

- (NSData *)dataFromModel:(id)model;
- (id)modelFromData:(NSData *)data;

@end
