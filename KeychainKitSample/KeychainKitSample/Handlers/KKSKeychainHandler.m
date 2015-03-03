//
//  KKSKeychainHandler.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import "KKSKeychainHandler.h"

@interface KKSKeychainHandler ()

@property (nonatomic) KKKeychainSession *keychainSession;
@property (nonatomic) KKSDataModel *dataModel;
@property (nonatomic, weak) id<KKSKeychainHandlerDataSource> dataSource;

@end

@implementation KKSKeychainHandler

#pragma mark - Object Life Cycle

- (instancetype)initWithDataModel:(KKSDataModel *)dataModel
                   dataSource:(id<KKSKeychainHandlerDataSource>)dataSource {
    self = [super init];
    
    if (self) {
        self.dataModel = dataModel;
        self.dataSource = dataSource;
        self.keychainSession = [[KKKeychainSession alloc] init];
    }
    
    return self;
}

#pragma mark - Operations

- (void)performKeychainOperation {
    KKKeychainItem *item = [self createKeychainItemAccordingToModel];
    KKKeychainOperation *operation = [self createKeychainOperationAccordingToModelWithItem:item];
    [self.keychainSession performOperation:operation completionBlock:^(NSArray *items, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            KKKeychainGenericPassword *genericPassword = [items firstObject]; // do something with this item
        }
    }];
}

- (KKKeychainItem *)createKeychainItemAccordingToModel {
    KKKeychainGenericPasswordBuilder *genericPasswordBuilder =
    [[KKKeychainGenericPasswordBuilder alloc] initWithKeychainSession:self.keychainSession];
    genericPasswordBuilder.data = [self.dataSource dataFromView];
    genericPasswordBuilder.label = [self.dataSource keychainItemLabel];
    genericPasswordBuilder.service = [self.dataSource keychainItemServiceName];
    if (self.dataModel.dataType == KKKeychainSampleDataTypeAccount &&
        [self.dataSource respondsToSelector:@selector(accountStringFromView)]) {
        genericPasswordBuilder.account = [self.dataSource accountStringFromView];
    }
    return [genericPasswordBuilder buildKeychainItem];
}

- (KKKeychainOperation *)createKeychainOperationAccordingToModelWithItem:(KKKeychainItem *)item {
    return [KKKeychainOperation operationWithType:self.dataModel.operationType item:item];
}

- (void)setSearchLimitIfSearchOperation:(KKKeychainOperation *)operation {
    if ([operation isKindOfClass:[KKKeychainSearchOperation class]]) {
        KKKeychainSearchOperation *searchOperation = (KKKeychainSearchOperation *)operation;
        if ([self.dataSource respondsToSelector:@selector(searchLimit)]) {
            searchOperation.searchLimit = [self.dataSource searchLimit];
        }
    }
}

@end
