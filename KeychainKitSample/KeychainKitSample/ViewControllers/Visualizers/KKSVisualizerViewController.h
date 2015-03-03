//
//  KKKeychainSampleVisualizerViewController.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

#import <UIKit/UIKit.h>
#import "KKKeychainSampleItemDataVisualizer.h"
#import "KKSDataModel.h"

@interface KKSVisualizerViewController : UIViewController <KKKeychainSampleItemDataVisualizer>

+ (instancetype)visualizerViewControllerFromDataType:(KKSDataType)dataType;

@end
