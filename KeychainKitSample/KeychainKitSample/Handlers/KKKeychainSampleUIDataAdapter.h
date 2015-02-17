//
//  KKKeychainSampleUIDataAdapter.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKKeychainSampleDataModel;

@interface KKKeychainSampleUIDataAdapter : NSObject

- (NSString *)cellTextForModel:(KKKeychainSampleDataModel *)dataModel;
- (NSString *)navigationBarTitleForModel:(KKKeychainSampleDataModel *)dataModel;
- (NSString *)buttonTitleForModel:(KKKeychainSampleDataModel *)dataModel;
- (NSString *)fullStringForModel:(KKKeychainSampleDataModel *)dataModel;

@end
