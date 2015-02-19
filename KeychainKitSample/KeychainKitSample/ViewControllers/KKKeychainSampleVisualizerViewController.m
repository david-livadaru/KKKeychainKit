//
//  KKKeychainSampleVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleVisualizerViewController.h"
#import "KKKeychainSampleVisualizerViewController_KKSPrivateInterface.h"
#import "KKSStringVisualizerViewController.h"
#import "KKSAccountVisualizerViewController.h"
#import "KKSDictionaryVisualizerViewController.h"
#import "KKSImageVisualizerViewController.h"

@implementation KKKeychainSampleVisualizerViewController

@dynamic dataConverter;

#pragma mark - Life Cycle

+ (instancetype)visualizerViewControllerFromDataType:(KKKeychainSampleDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeString:
            return [[KKSStringVisualizerViewController alloc] initWithNibName:nil bundle:nil];
        case KKKeychainSampleDataTypeAccount:
            return [[KKSAccountVisualizerViewController alloc] initWithNibName:nil bundle:nil];
        case KKKeychainSampleDataTypeDictionary:
            return [[KKSDictionaryVisualizerViewController alloc] initWithNibName:nil bundle:nil];
        case KKKeychainSampleDataTypeImage:
            return [[KKSImageVisualizerViewController alloc] initWithNibName:nil bundle:nil];
        default:
            return nil;
    }
}

#pragma mark - KKKeychainSample Item Data Visualizer

- (NSData *)dataFromView {
    return nil; // Abstract method
}

- (void)previewData:(NSData *)data {
    // Abstract method.
}

#pragma mark - Getters and Setters

- (KKKeychainSampleModelDataConverter *)dataConverter {
    return _dataConverter;
}

@end
