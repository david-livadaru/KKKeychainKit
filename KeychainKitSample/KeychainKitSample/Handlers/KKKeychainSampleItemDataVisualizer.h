//
//  KKKeychaimSampleItemDataConverter.h
//  KeychainKitSample
//
//  Created by david on 18/02/15.
//

@import KeychainKit;
#import <Foundation/Foundation.h>

@protocol KKKeychainSampleItemDataVisualizer <NSObject>

- (NSData *)dataFromView;
- (void)previewData:(NSData *)data;

@optional
- (NSString *)accountStringFromView;
- (void)previewAccountString:(NSString *)accountString;
- (KKKeychainSearchLimit)searchLimit;

@end
