//
//  KKKeychainSampleVisualizerViewController+KKSPrivateInterface.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSVisualizerViewController.h"
#import "KKSModelDataConverter.h"

@interface KKSVisualizerViewController (KKSPrivateInterface)

@property (nonatomic, readonly) KKSModelDataConverter *dataConverter;

@end
