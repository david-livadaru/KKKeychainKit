//
//  KKKeychainSampleItemViewController.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleItemViewController.h"
#import "KKKeychainSampleDataModel.h"
#import "KKKeychainSampleUIDataAdapter.h"

@interface KKKeychainSampleItemViewController ()

@property (nonatomic, strong) KKKeychainSampleDataModel *model;

@end

@implementation KKKeychainSampleItemViewController

#pragma mark - Life Cycle

- (instancetype)initWithModel:(KKKeychainSampleDataModel *)model {
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark - UI Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    KKKeychainSampleUIDataAdapter *dataUIAdapter = [[KKKeychainSampleUIDataAdapter alloc] init];
    self.navigationItem.title = [dataUIAdapter fullStringForModel:self.model];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

@end
