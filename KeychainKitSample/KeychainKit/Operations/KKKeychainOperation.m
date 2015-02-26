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
#import "KKKeychainGenericPasswordBuilder.h"
#import "KKKeychainItemBuilder+KeychainKitInterface.h"

@interface KKKeychainOperation ()

@property (nonatomic, assign, readwrite) KKKeychainOperationType operationType;
@property (nonatomic, strong, readwrite) KKKeychainItem *item;

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
    NSMutableDictionary *mutableAttributes = [attributes mutableCopy];
    [mutableAttributes setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnAttributes];
    attributes = [mutableAttributes copy];
    CFTypeRef result = NULL;
    OSStatus operationExecutionStatus = [self executeOperationWithAttributes:attributes result:&result];
    NSError *operationError = [self createErrorWithOSStatus:operationExecutionStatus];
    [self convertResult:result];
    if (completionBlock) {
        completionBlock([self completionBlockItemsFromResult:result], operationError);
    }
}

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return errSecUnimplemented; // this operation is not implemented
}

- (void)convertResult:(CFTypeRef)result {
    // TO BE IMPLEMENTED
    // check if this needs to be overrided by operations (such as update or search)
    NSDictionary *dictionary = (__bridge NSDictionary *)result;
    NSLog(@"%@", dictionary);
}

- (NSArray *)completionBlockItemsFromResult:(CFTypeRef)result {
    NSDictionary *dictionary = (__bridge NSDictionary *)result;
#warning you need to create this builder by using class attribute
    KKKeychainGenericPasswordBuilder *builder = [[KKKeychainGenericPasswordBuilder alloc] initWithKeychainSession:nil];
    return @[[builder buildKeychainItemFromDictionary:dictionary]];
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
