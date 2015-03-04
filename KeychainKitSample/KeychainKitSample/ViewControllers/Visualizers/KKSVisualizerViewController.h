//
//  KKKeychainSampleVisualizerViewController.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

@import UIKit;
#import "KKKeychainSampleItemDataVisualizer.h"
#import "KKSDataModel.h"

@interface KKSVisualizerViewController : UIViewController <KKKeychainSampleItemDataVisualizer>

+ (instancetype)visualizerViewControllerFromDataType:(KKSDataType)dataType;

@end
