//
//  KKKeychainSampleVisualizerViewController+KKSPrivateInterface.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleVisualizerViewController.h"
#import "KKKeychainSampleModelDataConverter.h"

@interface KKKeychainSampleVisualizerViewController () {
    @protected
    KKKeychainSampleModelDataConverter *_dataConverter;
}

@property (nonatomic, strong, readonly) KKKeychainSampleModelDataConverter *dataConverter;

@end
