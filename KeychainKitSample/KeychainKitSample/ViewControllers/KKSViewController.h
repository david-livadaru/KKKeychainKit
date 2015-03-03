//
//  KKKeychainSampleViewController.h
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//

#import <UIKit/UIKit.h>

@interface KKSViewController : UITableViewController

- (instancetype)initWithModel:(NSArray *)model; // the model is an array of instances of KKKeychainSampleDataModel

@end
