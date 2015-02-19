//
//  KKSStringVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 18/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSStringVisualizerViewController.h"
#import "KKKeychainSampleVisualizerViewController_KKSPrivateInterface.h"

@interface KKSStringVisualizerViewController ()

@property (nonatomic, strong) UITextField *textInput;

@end

@implementation KKSStringVisualizerViewController

#pragma mark - UI Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textInput = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textInput.placeholder = @"String to be added in Keychain...";
    [self.view addSubview:self.textInput];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    static CGFloat textInputPadding = 4.0f;
    
    [self.textInput sizeToFit];
    CGRect textInputFrame = self.textInput.frame;
    textInputFrame.origin.x = textInputPadding;
    textInputFrame.origin.y = textInputPadding;
    textInputFrame.size.width = CGRectGetWidth(self.view.bounds) - textInputPadding * 2;
    textInputFrame.size.height = MAX(CGRectGetHeight(textInputFrame), 44.0f);
    self.textInput.frame = textInputFrame;
}

#pragma mark - KKKeychainSampleItem Data Visualizer

- (NSData *)dataFromView {
    return [self.dataConverter dataFromModel:self.textInput.text];
}

- (void)previewData:(NSData *)data {
    self.textInput.text = [self.dataConverter modelFromData:data];
    self.textInput.enabled = NO;
}

#pragma mark - Getters and Setters

- (KKKeychainSampleModelDataConverter *)dataConverter {
    if (!_dataConverter) {
        _dataConverter = [KKKeychainSampleModelDataConverter dataConverterForDataType:KKKeychainSampleDataTypeString];
    }
    return [super dataConverter];
}

@end
