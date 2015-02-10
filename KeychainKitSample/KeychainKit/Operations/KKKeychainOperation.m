//
//  KKKeychainRequest.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainOperation.h"
@import Security;
#import "KKKeychainOperation+KeychainKitInteface.h"
#import "KKKeychainOperation+SubclassesInterface.h"
#import "KKKKeychainAddOperation.h"
#import "KKKeychainDeleteOperation.h"
#import "KKKeychainUpdateOperation.h"
#import "KKKeychainSearchOperation.h"
#import "KKKeychainItem+KeychainKitInterface.h"

@interface KKKeychainOperation ()

@property (nonatomic, assign, readwrite) KKKeychainOperationType    operationType;
@property (nonatomic, strong, readwrite) KKKeychainItem             *item;

@end

@implementation KKKeychainOperation

#pragma mark - Object Life Cycle

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item {
    self = [super init];
    
    if (self) {
        self.operationType = operationType;
        self.item = item;
    }
    
    return self;
}

+ (instancetype)operationWithType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item {
    Class operationClass = [KKKeychainOperation operationClassForType:operationType];
    KKKeychainOperation *operation = [[operationClass alloc] initWithOperationType:operationType item:item];
    return operation;
}

+ (Class)operationClassForType:(KKKeychainOperationType)operationType {
    switch (operationType) {
        case KKKeychainOperationTypeAdd:
            return [KKKKeychainAddOperation class];
        case KKKeychainOperationTypeDelete:
            return [KKKeychainDeleteOperation class];
        case KKKeychainOperationTypeUpdate:
            return [KKKeychainUpdateOperation class];
        case KKKeychainOperationTypeSearch:
            return [KKKeychainDeleteOperation class];
    }
}

#pragma mark - Execution

- (void)executeWithCompletionBlock:(void (^)(NSArray *items, NSError *error))completionBlock {
    NSError *attributesError = nil;
    NSDictionary *attributes = [self.item keychainAttributesWithError:&attributesError];
    CFTypeRef result = NULL;
    OSStatus operationExecutionStatus = [self executeOperationWithAttributes:attributes result:&result];
    NSError *operationError = [self createErrorWithOSStatus:operationExecutionStatus];
    if (completionBlock) {
        completionBlock(@[], operationError);
    }
}

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return errSecUnimplemented; // this operation is not implemented
}

- (void)convertResult:(CFTypeRef)result {
    // TO BE IMPLEMENTED
    // check if this needs to be overrided by operations (such as update or search)
}

- (NSError *)createErrorWithOSStatus:(OSStatus)status {
    if (status == errSecSuccess) {
        return nil;
    } else {
        return [[NSError alloc] initWithDomain:NSOSStatusErrorDomain
                                          code:status
                                      userInfo:nil];
    }
}

@end
