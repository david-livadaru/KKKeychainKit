//
//  KKeychainSampleModelDataConverter.h
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//

#import <Foundation/Foundation.h>
#import "KKSDataModel.h"

@interface KKSModelDataConverter : NSObject

+ (instancetype)dataConverterForDataType:(KKSDataType)dataType;

- (NSData *)dataFromModel:(id)model;
- (id)modelFromData:(NSData *)data;

@end
