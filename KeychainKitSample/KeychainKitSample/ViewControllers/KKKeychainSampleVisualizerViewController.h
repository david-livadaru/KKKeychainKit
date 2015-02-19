//
//  KKKeychainSampleVisualizerViewController.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKKeychainSampleItemDataVisualizer.h"
#import "KKKeychainSampleDataModel.h"

@interface KKKeychainSampleVisualizerViewController : UIViewController <KKKeychainSampleItemDataVisualizer>

+ (instancetype)visualizerViewControllerFromDataType:(KKKeychainSampleDataType)dataType;

@end
