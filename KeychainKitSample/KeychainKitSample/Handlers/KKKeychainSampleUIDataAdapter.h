//
//  KKKeychainSampleUIDataAdapter.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//

@import Foundation;

@class KKSDataModel;

@interface KKKeychainSampleUIDataAdapter : NSObject

- (NSString *)cellTextForModel:(KKSDataModel *)dataModel;
- (NSString *)navigationBarTitleForModel:(KKSDataModel *)dataModel;
- (NSString *)buttonTitleForModel:(KKSDataModel *)dataModel;
- (NSString *)fullStringForModel:(KKSDataModel *)dataModel;

@end
