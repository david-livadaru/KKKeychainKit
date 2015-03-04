//
//  KKImageVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

#import "KKSImageVisualizerViewController.h"
#import "KKSVisualizerViewController_KKSPrivateInterface.h"

@interface KKSImageVisualizerViewController () <UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIButton *addImageButton;

@end

@implementation KKSImageVisualizerViewController

#pragma mark - UI Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    self.addImageButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.addImageButton setTitle:@"Add image" forState:UIControlStateNormal];
    [self.addImageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addImageButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.addImageButton addTarget:self action:@selector(addImageButtonPressed:)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addImageButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.imageView.frame = self.view.bounds;
    self.addImageButton.hidden = self.imageView.image != nil;
    [self.addImageButton sizeToFit];
    CGRect addImageButtonFrame = self.addImageButton.frame;
    addImageButtonFrame.origin.x = CGRectGetMidX(self.view.bounds) - CGRectGetWidth(addImageButtonFrame) / 2;
    addImageButtonFrame.origin.y = CGRectGetMidY(self.view.bounds) - CGRectGetHeight(addImageButtonFrame) / 2;
    self.addImageButton.frame = addImageButtonFrame;
}

#pragma mark - Action Handling

- (void)addImageButtonPressed:(UIButton *)button {
    UIImagePickerController *imagePickerViewController = [[UIImagePickerController alloc] init];
    imagePickerViewController.delegate = self;
    imagePickerViewController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:imagePickerViewController animated:YES completion:nil];
}

#pragma mark - UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.view setNeedsLayout];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - KKSItem Data Visualizer

- (NSData *)dataFromView {
    return [self.dataConverter dataFromModel:self.imageView.image];
}

- (void)previewData:(NSData *)data {
    self.imageView.image = [self.dataConverter modelFromData:data];
    [self.view setNeedsLayout];
}

@end
