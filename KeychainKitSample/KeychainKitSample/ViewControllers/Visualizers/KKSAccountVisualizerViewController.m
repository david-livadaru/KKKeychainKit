//
//  KKAccountVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSAccountVisualizerViewController.h"
#import "KKSVisualizerViewController_KKSPrivateInterface.h"

@interface KKSAccountVisualizerViewController ()

@property (nonatomic) UITextField *accountNameTextField;
@property (nonatomic) UITextField *passwordTextField;

@end

@implementation KKSAccountVisualizerViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.accountNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.accountNameTextField.placeholder = @"Add account name";
    self.accountNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.accountNameTextField];
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.passwordTextField.placeholder = @"Add password";
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.passwordTextField];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    static CGFloat padding = 4.0f;
    static CGFloat spacing = 4.0;
    
    [self.accountNameTextField sizeToFit];
    CGRect accountNameTextFieldFrame = self.accountNameTextField.frame;
    accountNameTextFieldFrame.origin.x = padding;
    accountNameTextFieldFrame.origin.y = padding;
    accountNameTextFieldFrame.size.width = (CGRectGetWidth(self.view.bounds) - padding * 2);
    accountNameTextFieldFrame.size.height = MAX(CGRectGetHeight(accountNameTextFieldFrame), 44.0f);
    self.accountNameTextField.frame = accountNameTextFieldFrame;
    
    [self.passwordTextField sizeToFit];
    CGRect passwordTextFieldFrame = self.passwordTextField.frame;
    passwordTextFieldFrame.origin.x = padding;
    passwordTextFieldFrame.origin.y = CGRectGetMaxY(accountNameTextFieldFrame) + spacing;
    passwordTextFieldFrame.size = accountNameTextFieldFrame.size;
    self.passwordTextField.frame = passwordTextFieldFrame;
}

#pragma mark - KKSItem Data Visualizer

- (NSData *)dataFromView {
    return [self.dataConverter dataFromModel:self.passwordTextField.text];
}

- (void)previewData:(NSData *)data {
    self.passwordTextField.text = [self.dataConverter modelFromData:data];
    self.passwordTextField.enabled = NO;
}

- (NSString *)accountStringFromView {
    return self.accountNameTextField.text;
}

- (void)previewAccountString:(NSString *)accountString {
    self.accountNameTextField.text = accountString;
    self.accountNameTextField.enabled = NO;
}

@end
