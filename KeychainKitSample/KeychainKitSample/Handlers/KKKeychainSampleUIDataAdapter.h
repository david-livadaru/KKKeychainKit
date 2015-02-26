//
//  KKKeychainSampleUIDataAdapter.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KKSDataModel;

@interface KKKeychainSampleUIDataAdapter : NSObject

- (NSString *)cellTextForModel:(KKSDataModel *)dataModel;
- (NSString *)navigationBarTitleForModel:(KKSDataModel *)dataModel;
- (NSString *)buttonTitleForModel:(KKSDataModel *)dataModel;
- (NSString *)fullStringForModel:(KKSDataModel *)dataModel;

@end
