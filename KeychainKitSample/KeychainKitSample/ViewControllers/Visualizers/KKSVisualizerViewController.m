//
//  KKKeychainSampleVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSVisualizerViewController.h"
#import "KKSVisualizerViewController_KKSPrivateInterface.h"
#import "KKSStringVisualizerViewController.h"
#import "KKSAccountVisualizerViewController.h"
#import "KKSDictionaryVisualizerViewController.h"
#import "KKSImageVisualizerViewController.h"

@interface KKSVisualizerViewController ()

@property (nonatomic, readwrite) KKSModelDataConverter *dataConverter;

@end

@implementation KKSVisualizerViewController

#pragma mark - Life Cycle

- (instancetype)initWithDataType:(KKSDataType)dataType {
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.dataConverter = [KKSModelDataConverter dataConverterForDataType:dataType];
    }
    
    return self;
}

+ (instancetype)visualizerViewControllerFromDataType:(KKSDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeString:
            return [[KKSStringVisualizerViewController alloc] initWithDataType:dataType];
        case KKKeychainSampleDataTypeAccount:
            return [[KKSAccountVisualizerViewController alloc] initWithDataType:dataType];
        case KKKeychainSampleDataTypeDictionary:
            return [[KKSDictionaryVisualizerViewController alloc] initWithDataType:dataType];
        case KKKeychainSampleDataTypeImage:
            return [[KKSImageVisualizerViewController alloc] initWithDataType:dataType];
        default:
            return nil;
    }
}

#pragma mark - KKSItem Data Visualizer

- (NSData *)dataFromView {
    return nil; // Abstract method
}

- (void)previewData:(NSData *)data {
    // Abstract method.
}

@end
