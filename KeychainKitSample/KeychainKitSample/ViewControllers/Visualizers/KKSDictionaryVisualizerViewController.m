//
//  KKDictionaryVisualizerViewController.m
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

#import "KKSDictionaryVisualizerViewController.h"
#import "KKSVisualizerViewController_KKSPrivateInterface.h"
#import "KKSDictionaryTableViewCell.h"
#import "KKSAddDictionaryPairView.h"
#import "KKSDictionaryPair.h"

static NSString * const kTableViewCellReuseIdentifier =
@"org.KeychainKit.Sample.KKSDictionaryVisualizerViewController.kTableViewCellReuseIdentifier";

@interface KKSDictionaryVisualizerViewController () <UITableViewDataSource, UITableViewDelegate,
KKSAddDictionaryPairViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) KKSAddDictionaryPairView *addDictionaryPairView;

@property (nonatomic) NSMutableArray *dictionaryPairs;

- (NSDictionary *)dictionaryFromPairs;

@end

@implementation KKSDictionaryVisualizerViewController

#pragma mark - UI Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dictionaryPairs = [[NSMutableArray alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[KKSDictionaryTableViewCell class]
           forCellReuseIdentifier:kTableViewCellReuseIdentifier];
    self.addDictionaryPairView = [[KKSAddDictionaryPairView alloc] initWithFrame:self.view.bounds];
    self.addDictionaryPairView.delegate = self;
    [self.view addSubview:self.addDictionaryPairView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.addDictionaryPairView sizeToFit];
    CGRect tableViewFrame = self.view.bounds;
    tableViewFrame.origin.y = CGRectGetMaxY(self.addDictionaryPairView.frame);
    tableViewFrame.size.height -= CGRectGetMaxY(self.addDictionaryPairView.frame);
    self.tableView.frame = tableViewFrame;
}

#pragma mark - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dictionaryPairs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKSDictionaryTableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:kTableViewCellReuseIdentifier];
    KKSDictionaryPair *dictionaryPairAtIndexPath = [self.dictionaryPairs objectAtIndex:indexPath.row];
    cell.textLabel.text = @"Key:";
    cell.detailTextLabel.text = @"Object:";
    cell.keyLabel.text = dictionaryPairAtIndexPath.key;
    cell.objectLabel.text = dictionaryPairAtIndexPath.object;
    return cell;
}

#pragma mark - UITableView Delegate

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - KKSAddDictionaryPairView Delegate

- (void)addDictionaryPairViewButtonPressed:(KKSAddDictionaryPairView *)addDictionaryPairView {
    [self addPairToDictionary];
    [self insertNewRowInTable];
}

#pragma mark - Data Handling

- (NSDictionary *)dictionaryFromPairs {
    NSMutableDictionary *mutableDictionary =
    [[NSMutableDictionary alloc] initWithCapacity:[self.dictionaryPairs count]];
    for (KKSDictionaryPair *dictionaryPair in self.dictionaryPairs) {
        [mutableDictionary setObject:dictionaryPair.object forKey:dictionaryPair.key];
    }
    return [mutableDictionary copy];
}

- (void)fillDictionaryPairsFromDictionary:(NSDictionary *)dictionary {
    [self.dictionaryPairs removeAllObjects];
    for (NSString *key in dictionary.allKeys) {
        NSString *object = [dictionary objectForKey:key];
        KKSDictionaryPair *dictionaryPair = [[KKSDictionaryPair alloc] initWithKey:key object:object];
        [self.dictionaryPairs addObject:dictionaryPair];
    }
}

- (void)addPairToDictionary {
    KKSDictionaryPair *dictionaryPair =
    [[KKSDictionaryPair alloc] initWithKey:self.addDictionaryPairView.keyString
                                    object:self.addDictionaryPairView.objectString];
    [self.dictionaryPairs insertObject:dictionaryPair atIndex:0];
}

- (void)insertNewRowInTable {
    NSIndexPath *indexPathAtTheBeginning = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPathAtTheBeginning]
                          withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark - KKSItem Data Visualizer

- (NSData *)dataFromView {
    return [self.dataConverter dataFromModel:self.dictionaryFromPairs];
}

- (void)previewData:(NSData *)data {
    NSDictionary *dictionary = [self.dataConverter modelFromData:data];
    [self fillDictionaryPairsFromDictionary:dictionary];
    if ([self isViewLoaded]) {
        [self.tableView reloadData];
    }
}

@end
