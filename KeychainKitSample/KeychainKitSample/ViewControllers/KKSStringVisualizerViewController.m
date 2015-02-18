//
//  KKSStringVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 18/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSStringVisualizerViewController.h"

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
    
    CGRect textInputFrame = self.textInput.frame;
    textInputFrame.origin.x = textInputPadding;
    textInputFrame.origin.y = textInputPadding;
    textInputFrame.size.width = CGRectGetWidth(self.view.bounds) - textInputPadding * 2;
    textInputFrame.size.height = 44.0f;
}

#pragma mark - KKKeychaimSampleItem Data Visualizer

- (NSData *)dataFromView {
    return nil;
}

- (void)previewData:(NSData *)data {
    // TO DO
}

@end
