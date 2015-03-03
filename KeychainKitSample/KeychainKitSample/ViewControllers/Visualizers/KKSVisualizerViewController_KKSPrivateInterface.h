//
//  KKKeychainSampleVisualizerViewController+KKSPrivateInterface.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

#import "KKSVisualizerViewController.h"
#import "KKSModelDataConverter.h"

@interface KKSVisualizerViewController (KKSPrivateInterface)

@property (nonatomic, readonly) KKSModelDataConverter *dataConverter;

@end
