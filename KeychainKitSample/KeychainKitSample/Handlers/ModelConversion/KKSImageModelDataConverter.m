//
//  KKKeychainSampleImageModelDataConverter.m
//  KeychainKitSample
//
//  Created by david on 19/02/15.
//

@import UIKit;
#import "KKSImageModelDataConverter.h"

@implementation KKSImageModelDataConverter

#pragma mark - KKKeychainSample Model Data Converter Override

- (NSData *)dataFromModel:(id)model {
    UIImage *imageModel = model;
    return UIImagePNGRepresentation(imageModel);
}

- (id)modelFromData:(NSData *)data {
    return [UIImage imageWithData:data];
}

@end
