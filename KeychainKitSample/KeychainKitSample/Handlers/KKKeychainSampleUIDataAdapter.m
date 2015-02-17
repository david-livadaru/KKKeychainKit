//
//  KKKeychainSampleUIDataAdapter.m
//  KeychainKitSample
//
//  Created by david on 17/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "KKKeychainSampleUIDataAdapter.h"
#import "KKKeychainSampleDataModel.h"

@implementation KKKeychainSampleUIDataAdapter

#pragma mark - Public Interface

- (NSString *)cellTextForModel:(KKKeychainSampleDataModel *)dataModel {
    return [self stringForDataType:dataModel.dataType];
}

- (NSString *)navigationBarTitleForModel:(KKKeychainSampleDataModel *)dataModel {
    return [[NSString alloc] initWithFormat:@"%@ Item", [self stringForOperationType:dataModel.operationType]];
}

- (NSString *)buttonTitleForModel:(KKKeychainSampleDataModel *)dataModel {
    return [self stringForDataType:dataModel.dataType];
}

- (NSString *)fullStringForModel:(KKKeychainSampleDataModel *)dataModel {
    NSString *firstPart = [self stringForOperationType:dataModel.operationType];
    NSString *secordPart = [self stringForDataType:dataModel.dataType];
    return [[NSString alloc] initWithFormat:@"%@ %@", firstPart, secordPart];
}

#pragma mark - Model Data Adaptivity

- (NSString *)stringForOperationType:(KKKeychainOperationType)operationType {
    switch (operationType) {
        case KKKeychainOperationTypeAdd:
            return @"Add";
        case KKKeychainOperationTypeDelete:
            return @"Delete";
        case KKKeychainOperationTypeSearch:
            return @"Search";
        case KKKeychainOperationTypeUpdate:
            return @"Update";
        default:
            return @"";
    }
}

- (NSString *)stringForDataType:(KKKeychainSampleDataType)dataType {
    switch (dataType) {
        case KKKeychainSampleDataTypeAccount:
            return @"Account";
        case KKKeychainSampleDataTypeString:
            return @"String";
        case KKKeychainSampleDataTypeDictionary:
            return @"Dictionary";
        case KKKeychainSampleDataTypeImage:
            return @"Image";
        default:
            return @"";
    }
}

@end
