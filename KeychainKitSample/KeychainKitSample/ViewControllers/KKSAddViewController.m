//
//  KKSAddViewController.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKSAddViewController.h"
@import QuartzCore;
#import "KKSKeychainHandler.h"

@interface KKSAddViewController ()

@property (nonatomic, strong) UILabel               *addStringLabel;
@property (nonatomic, strong) UITextField           *addStringTextField;
@property (nonatomic, strong) UIButton              *addStringButton;

@property (nonatomic, strong) KKSKeychainHandler    *keychainHandler;

@end

@implementation KKSAddViewController

#pragma mark - UI Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup controller's view
    self.view.backgroundColor = [UIColor whiteColor];
    
    // initialize model data
    self.keychainHandler = [[KKSKeychainHandler alloc] init];
    
    // setup subviews
    self.addStringLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.addStringLabel.text = @"Add a string";
    [self.view addSubview:self.addStringLabel];
    self.addStringTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.addStringTextField.layer.borderWidth = 1.0f;
    self.addStringTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    self.addStringTextField.layer.cornerRadius = 5.0f;
    [self.view addSubview:self.addStringTextField];
    self.addStringButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.addStringButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.addStringButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addStringButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.addStringButton addTarget:self action:@selector(addStringButtonPressed:)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addStringButton];
    
    // Gestures
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Some layout
    [self.addStringLabel sizeToFit];
    CGRect labelFrame = self.addStringLabel.frame;
    labelFrame.origin.x = 10.0f;
    labelFrame.origin.y = 40.0f;
    self.addStringLabel.frame = labelFrame;
    CGRect textFieldFrame = self.addStringTextField.frame;
    textFieldFrame.origin.x = CGRectGetMaxX(labelFrame) + 10.0f;
    textFieldFrame.origin.y = CGRectGetMinY(labelFrame);
    textFieldFrame.size.width = 150.0f;
    textFieldFrame.size.height = CGRectGetHeight(labelFrame);
    self.addStringTextField.frame = textFieldFrame;
    [self.addStringButton sizeToFit];
    CGRect buttonFrame = self.addStringButton.frame;
    buttonFrame.origin.x = CGRectGetMaxX(textFieldFrame) + 10.0f;
    CGFloat offset = ABS(CGRectGetHeight(buttonFrame) - CGRectGetHeight(labelFrame)) / 2;
    buttonFrame.origin.y = CGRectGetMinY(textFieldFrame) - offset;
    self.addStringButton.frame = buttonFrame;
}

#pragma mark - Action Handling

- (void)addStringButtonPressed:(UIButton *)button {
    [self.view endEditing:YES];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.keychainHandler addStringInKeychain:self.addStringTextField.text key:@"org.david.live.addString"];
}

- (void)viewTapped:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

@end
