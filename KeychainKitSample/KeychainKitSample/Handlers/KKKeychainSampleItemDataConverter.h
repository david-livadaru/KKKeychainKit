//
//  KKKeychaimSampleItemDataConverter.h
//  KeychainKitSample
//
//  Created by david on 18/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KKKeychaimSampleItemDataVisualizer <NSObject>

- (NSData *)dataFromView;
- (void)previewData:(NSData *)data;

@end