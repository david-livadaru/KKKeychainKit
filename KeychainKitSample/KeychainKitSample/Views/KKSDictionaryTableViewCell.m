//
//  KKSDictionaryTableViewCell.m
//  KeychainKitSample
//
//  Created by david on 25/02/15.
//

#import "KKSDictionaryTableViewCell.h"

static const CGFloat kPadding = 4.0f;
static const CGFloat kSpacing = 4.0f;

@interface KKSDictionaryTableViewCell ()

@property (nonatomic, readwrite) UILabel *keyLabel;
@property (nonatomic, readwrite) UILabel *objectLabel;

@end

@implementation KKSDictionaryTableViewCell

#pragma mark - Life Cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.keyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.keyLabel];
        self.objectLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.objectLabel];
    }
    
    return self;
}

#pragma mark - UIView Override

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutTextLabel];
    [self layoutDetailTextLabel];
    [self layoutKeyLabel];
    [self layoutObjectLabel];
}

#pragma mark - Layout Subviews

- (void)layoutTextLabel {
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = kPadding;
    textLabelFrame.origin.y = kSpacing;
    self.textLabel.frame = textLabelFrame;
}

- (void)layoutDetailTextLabel {
    CGRect detailTextFrame = self.detailTextLabel.frame;
    detailTextFrame.origin.x = CGRectGetMidX(self.bounds);
    detailTextFrame.origin.y = kPadding;
    self.detailTextLabel.frame = detailTextFrame;
}

- (void)layoutKeyLabel {
    [self.keyLabel sizeToFit];
    CGRect keyLabelFrame = self.keyLabel.frame;
    keyLabelFrame.origin.x = CGRectGetMinX(self.textLabel.frame);
    keyLabelFrame.origin.y = CGRectGetMaxY(self.textLabel.frame) + kSpacing;
    self.keyLabel.frame = keyLabelFrame;
}

- (void)layoutObjectLabel {
    [self.objectLabel sizeToFit];
    CGRect objectLabelFrame = self.objectLabel.frame;
    objectLabelFrame.origin.x = CGRectGetMinX(self.detailTextLabel.frame);
    objectLabelFrame.origin.y = CGRectGetMaxY(self.detailTextLabel.frame) + kSpacing;
    self.objectLabel.frame = objectLabelFrame;
}

@end
