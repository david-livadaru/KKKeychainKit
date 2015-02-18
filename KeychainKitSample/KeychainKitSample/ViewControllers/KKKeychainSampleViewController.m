
//
//  KKKeychainSampleViewController.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleViewController.h"
#import "KKKeychainSampleItemViewController.h"
#import "KKKeychainSampleDataModel.h"
#import "KKKeychainSampleUIDataAdapter.h"

static NSString * kCellIdentifier = @"org.david.KeychainSample.KKKeychainSampleViewController.Cell.Identifier";

@interface KKKeychainSampleViewController ()

@property (nonatomic, strong) NSArray *model;
@property (nonatomic, strong) KKKeychainSampleUIDataAdapter *dataUIAdapter;

@end

@implementation KKKeychainSampleViewController

#pragma mark - Life Cycle

- (instancetype)initWithModel:(NSArray *)model {
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
    self.dataUIAdapter = [[KKKeychainSampleUIDataAdapter alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero]; // remove unneeded cells
    self.navigationItem.title = [self.dataUIAdapter navigationBarTitleForModel:[self.model firstObject]];
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    KKKeychainSampleDataModel *dataModelAtIdex = [self.model objectAtIndex:indexPath.item];
    cell.textLabel.text = [self.dataUIAdapter cellTextForModel:dataModelAtIdex];
    cell.imageView.image = [UIImage imageNamed:[self imageNameForDataType:dataModelAtIdex.dataType]];
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KKKeychainSampleDataModel *modelAtIndexPath = [self.model objectAtIndex:indexPath.item];
    KKKeychainSampleItemViewController *itemViewController = [[KKKeychainSampleItemViewController alloc] initWithModel:modelAtIndexPath];
    [self.navigationController pushViewController:itemViewController animated:YES];
}

#pragma mark - Data Handling

- (NSString *)imageNameForDataType:(KKKeychainSampleDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeString:
            return @"string";
        case KKKeychainSampleDataTypeAccount:
            return @"account";
        case KKKeychainSampleDataTypeDictionary:
            return @"dictionary";
        case KKKeychainSampleDataTypeImage:
            return @"image";
        default:
            return @"";
    }
}

@end
