//
//  KKKeychainRequest.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import "KKKeychainOperation.h"
@import Security;
#import "KKKeychainOperation+KeychainKitInteface.h"
#import "KKKeychainOperation+SubclassesInterface.h"
#import "KKKeychainAddOperation.h"
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
            return [KKKeychainAddOperation class];
        case KKKeychainOperationTypeDelete:
            return [KKKeychainDeleteOperation class];
        case KKKeychainOperationTypeUpdate:
            return [KKKeychainUpdateOperation class];
        case KKKeychainOperationTypeSearch:
            return [KKKeychainSearchOperation class];
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
    if (completionBlock) {
        CFTypeRef keychainItemClass = (__bridge CFTypeRef)attributes[(__bridge id)kSecClass];
        NSArray *completionBlockItems = [self completionBlockItemsFromResult:result
                                                           keychainItemClass:keychainItemClass];
        completionBlock(completionBlockItems, operationError);
    }
}

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result {
    return errSecUnimplemented; // this operation is not implemented
}

- (NSArray *)completionBlockItemsFromResult:(CFTypeRef)result keychainItemClass:(CFTypeRef)keychainItemClass {
    NSDictionary *dictionary = (__bridge NSDictionary *)result;
    KKKeychainItemBuilder *builder = [KKKeychainItemBuilder builderWithKeychainItemClass:keychainItemClass
                                                                         keychainSession:nil];
    return @[[builder buildKeychainItemFromDictionary:dictionary]];
}

- (NSError *)createErrorWithOSStatus:(OSStatus)status {
    if (status == errSecSuccess) {
        return nil;
    } else {
        NSMutableDictionary *errorUserInfo = [[NSMutableDictionary alloc] init];
        errorUserInfo[NSLocalizedFailureReasonErrorKey] = [self errorMesageForOSStatus:status];
        return [[NSError alloc] initWithDomain:NSOSStatusErrorDomain
                                          code:status
                                      userInfo:errorUserInfo];
    }
}

- (NSString *)errorMesageForOSStatus:(OSStatus)status {
    switch (status) {
        case errSecUnimplemented:
            return @"Function or operation is not implemented.";
        case errSecIO:
            return @"Input/Output error occured.";
        case errSecOpWr:
            return @"File is already open with write permisions.";
        case errSecParam:
            return @"One or more parameters were not valid.";
        case errSecAllocate:
            return @"Failed to allocate memory.";
        case errSecUserCanceled:
            return @"User canceled the operation.";
        case errSecBadReq:
            return @"Bad parameter or invalid state for operation.";
        case errSecNotAvailable:
            return @"No keychain is available. You may need to restart your device.";
        case errSecDuplicateItem:
            return @"The specified item already exists in the keychain.";
        case errSecItemNotFound:
            return @"The specified item could not be found in the keychain.";
        case errSecInteractionNotAllowed:
            return @"User interaction is not allowed.";
        case errSecDecode:
            return @"Unable to decode the provided data.";
        case errSecAuthFailed:
            return @"The user name or passphrase you entered is not correct.";
        case errSecSuccess:
            return @"";
        default:
            return @"Unknown error!";
    }
}


@end
