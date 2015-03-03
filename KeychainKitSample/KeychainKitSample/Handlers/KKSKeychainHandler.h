//
//  KKSKeychainHandler.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

@import KeychainKit;
#import <Foundation/Foundation.h>
#import "KKKeychainSampleItemDataVisualizer.h"
#import "KKSDataModel.h"

@class KKSKeychainHandler;

@protocol KKSKeychainHandlerDataSource <KKKeychainSampleItemDataVisualizer>

- (NSString *)keychainItemLabel;
- (NSString *)keychainItemServiceName;

@end

@interface KKSKeychainHandler : NSObject

- (instancetype)initWithDataModel:(KKSDataModel *)dataModel
                   dataSource:(id<KKSKeychainHandlerDataSource>)dataSource;

- (void)performKeychainOperation;

@end
