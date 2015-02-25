//
//  KKSAddDictionaryPairView.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKSAddDictionaryPairView.h"
#import "NSString+KKSAdditions.h"

typedef NS_ENUM(NSUInteger, KKSAddPairButtonVisibilityState) {
    KKSAddPairButtonVisibilityStateHidden = 1,
    KKSAddPairButtonVisibilityStateVisible
};

// UI Layout Constants
static CGFloat kPadding = 4.0f;
static CGFloat kSpacing = 4.0f;
static CGFloat kRecommendedButtonSizeComponent = 44.0f;

@interface KKSAddDictionaryPairView ()

@property (nonatomic) UITextField *keyTextField;
@property (nonatomic) UITextField *objectTextField;
@property (nonatomic) UIButton *addPairButton;
@property (nonatomic, assign) KKSAddPairButtonVisibilityState addPairButtonVisibilityState;
@property (nonatomic, assign, getter=isAddPairButtonVisible) BOOL addPairButtonVisible;

@end

@implementation KKSAddDictionaryPairView

@dynamic keyString;
@dynamic objectString;
@dynamic addPairButtonVisible;

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubviews];
        [self customizeSubviews];
        [self setupTargetActions];
        self.addPairButtonVisibilityState = KKSAddPairButtonVisibilityStateHidden;
    }
    
    return self;
}

- (void)setupTargetActions {
    [self.keyTextField addTarget:self action:@selector(textFieldDidChangeText:) forControlEvents:UIControlEventEditingChanged];
    [self.objectTextField addTarget:self action:@selector(textFieldDidChangeText:) forControlEvents:UIControlEventEditingChanged];
    [self.addPairButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addPairButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
}

#pragma mark - Getters and Setters

- (NSString *)keyString {
    return self.keyTextField.text;
}

- (NSString *)objectString {
    return self.objectTextField.text;
}

- (BOOL)isAddPairButtonVisible {
    return self.addPairButtonVisibilityState == KKSAddPairButtonVisibilityStateVisible;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

#pragma mark - UIView Override

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutAddPairButton];
    [self layoutKeyTextField];
    [self layoutObjectTextField];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize requiredSize = CGSizeZero;
    CGFloat minimumWidth = kPadding * 2 + kSpacing + kRecommendedButtonSizeComponent * 3;
    requiredSize.width = MAX(size.width, minimumWidth);
    requiredSize.height = kPadding * 2 + kRecommendedButtonSizeComponent;
    return requiredSize;
}

#pragma mark - Layout Subviews

- (void)layoutKeyTextField {
    CGRect keyTextFieldFrame = self.keyTextField.frame;
    keyTextFieldFrame.origin.x = kPadding;
    keyTextFieldFrame.origin.y = kPadding;
    keyTextFieldFrame.size.width = [self textFieldWidthAccodingToAddPairButtonVisibility];
    keyTextFieldFrame.size.height = CGRectGetHeight(self.bounds) - kPadding * 2;
    self.keyTextField.frame = keyTextFieldFrame;
}

- (void)layoutObjectTextField {
    CGRect objectTextFieldFrame = self.objectTextField.frame;
    objectTextFieldFrame.origin.x = CGRectGetMaxX(self.keyTextField.frame) + kSpacing;
    objectTextFieldFrame.origin.y = CGRectGetMinY(self.keyTextField.frame);
    objectTextFieldFrame.size = self.keyTextField.frame.size;
    self.objectTextField.frame = objectTextFieldFrame;
}

- (void)layoutAddPairButton {
    [self.addPairButton sizeToFit];
    CGRect addPairButtonFrame = self.addPairButton.frame;
    addPairButtonFrame.origin.x = CGRectGetWidth(self.bounds);
    if (self.isAddPairButtonVisible) {
        addPairButtonFrame.origin.x -= CGRectGetWidth(addPairButtonFrame) + kPadding;
    }
    addPairButtonFrame.size.width = MAX(CGRectGetWidth(addPairButtonFrame), kRecommendedButtonSizeComponent);
    addPairButtonFrame.size.height = MAX(CGRectGetHeight(addPairButtonFrame), kRecommendedButtonSizeComponent);
    addPairButtonFrame.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(addPairButtonFrame)) / 2;
    self.addPairButton.frame = addPairButtonFrame;
}

- (CGFloat)textFieldWidthAccodingToAddPairButtonVisibility {
    CGFloat textFieldsAvailableSpace = (CGRectGetMinX(self.addPairButton.frame) - kSpacing - kPadding); // left padding and spacing between add pair button and text fields
    return (textFieldsAvailableSpace - kSpacing) / 2; // remove space between text fields
}

#pragma mark - View Behaviour

- (void)updateAddPairButtonVisibilityIfNecessary {
    BOOL buttonVisibilityStateDidChange = [self updateAddPairButtonInternalVisibilityStateIfNecesary];
    if (buttonVisibilityStateDidChange) {
        [UIView animateWithDuration:0.3 animations:^{
            [self setNeedsLayout];
            [self layoutIfNeeded];
        }];
    }
}

- (BOOL)updateAddPairButtonInternalVisibilityStateIfNecesary {
    KKSAddPairButtonVisibilityState oldState = self.addPairButtonVisibilityState;
    self.addPairButtonVisibilityState = [self buttonVisibilityStateAccordingToTextFieldsText];
    return oldState != self.addPairButtonVisibilityState;
}

- (KKSAddPairButtonVisibilityState)buttonVisibilityStateAccordingToTextFieldsText {
    BOOL keyTextFieldHasText = [self.keyTextField.text lengthByRemovingWhiteSpaceAndNewLineCharacters] != 0;
    BOOL objectTextFieldHasText = [self.objectTextField.text lengthByRemovingWhiteSpaceAndNewLineCharacters] != 0;
    BOOL textFieldsHaveText = keyTextFieldHasText && objectTextFieldHasText;
    return (textFieldsHaveText) ? KKSAddPairButtonVisibilityStateVisible : KKSAddPairButtonVisibilityStateHidden;
}

- (void)clearTextFields {
    self.keyTextField.text = @"";
    self.objectTextField.text = @"";
    [self updateAddPairButtonVisibilityIfNecessary];
}

#pragma mark - Action Handling

- (void)addPairButtonPressed:(UIButton *)button {
    [self.delegate addDictionaryPairViewButtonPressed:self];
    [self clearTextFields];
}

- (void)textFieldDidChangeText:(UITextField *)textField {
    [self updateAddPairButtonVisibilityIfNecessary];
}

#pragma mark - Private Customization

- (void)addSubviews {
    self.keyTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.keyTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.keyTextField];
    self.objectTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.objectTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.objectTextField];
    self.addPairButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self addSubview:self.addPairButton];
}

- (void)customizeSubviews {
    [self customizeKeyTextField];
    [self customizeObjectTextField];
    [self customizeAddPairButton];
}

- (void)customizeKeyTextField {
    self.keyTextField.placeholder = @"Add pair's key";
}

- (void)customizeObjectTextField {
    self.objectTextField.placeholder = @"Add pair's object";
}

- (void)customizeAddPairButton {
    [self.addPairButton setTitle:@"Add Pair" forState:UIControlStateNormal];
    [self.addPairButton addTarget:self action:@selector(addPairButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

@end
