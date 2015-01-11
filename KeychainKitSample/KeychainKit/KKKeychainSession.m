//
//  KKKeychainSession.m
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import "KKKeychainSession.h"
@import CoreFoundation;
@import Security;
#import "KKKeychainOperation.h"
#import "KKKeychainItem.h"
#import "KKKeychainItem_KeychainKitInterface.h"
#import "KKError.h"

@implementation KKKeychainSession

#pragma mark - Facilities

- (void)performOperation:(KKKeychainOperation *)operation completion:(void (^)(NSArray *items, NSError *error))completion {
    NSError *attributesError = nil;
    NSDictionary *attributes = [operation.item keychainAttributesWithError:&attributesError];
    if (attributesError) {
        if (completion) {
            completion(nil, attributesError);
        }
    }
//    NSDictionary *attributes = [self attributesForOperation:operation completion:completion];
    if (attributes) {
        [self executeOperation:operation attributes:attributes completion:completion];
    }
    // error example
//    NSError *error = [[NSError alloc] initWithDomain:NSOSStatusErrorDomain
//                                                code:KKErrorAllocateFailed
//                                            userInfo:nil];
//    if (completion) {
//        completion(nil, error);
//    }
}

#pragma mark - Operation Handling

//- (NSDictionary *)attributesForOperation:(KKKeychainOperation *)operation completion:(void (^)(NSArray *items, NSError *error))completion {
//    KKKeychainItem *item = operation.item;
//    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
//    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersion)]) { // iOS 8.0 or later?
//        CFErrorRef accessControlError = NULL;
//        SecAccessControlRef accessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
//                                                                            [self accessControlProtectionFromItem:item], kSecAccessControlUserPresence, &accessControlError);
//        if (accessControlError) { // was there any error
//            if (completion) {
//                completion(nil, (__bridge NSError *)accessControl);
//            }
//            return nil;
//        } else {
//            [attributes setObject:(__bridge_transfer id)accessControl
//                           forKey:(__bridge id)kSecAttrAccessControl];
//        }
//    }
//    
//    if (item.serviceName) {
//        [attributes setObject:item.serviceName
//                       forKey:(__bridge id)kSecAttrService];
//    }
//    if (item.data) {
//        [attributes setObject:item.data
//                       forKey:(__bridge id)kSecValueData];
//    }
//    [attributes setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
//    [attributes setObject:@YES forKey:(__bridge id)kSecReturnAttributes];
//    return attributes;
//}

- (void)executeOperation:(KKKeychainOperation *)operation attributes:(NSDictionary *)attributes completion:(void (^)(NSArray *items, NSError *error))completion {
    switch (operation.operationType) {
        case KKKeychainOperationTypeAdd: {
#warning check if you need the item, how do you want data? (NSData, NSDictionary or Reference)
            CFTypeRef result;
            OSStatus resultCode = SecItemAdd((__bridge CFDictionaryRef)attributes, &result);
            CFDictionaryRef dictionary = result;
            NSDictionary *resultDictionary = (__bridge_transfer NSDictionary *)dictionary;
            NSLog(@"Result:\n%@", resultDictionary);
            NSError *operationError = [self createErrorWithOSStatus:resultCode];
            if (operationError) {
                if (completion) {
                    completion(nil, operationError);
                }
            } else {
                if (completion) {
                    completion(@[], nil);
                }
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - Error Creation

- (NSError *)createErrorWithOSStatus:(OSStatus)status {
    if (status == errSecSuccess) {
        return nil;
    } else {
        return [[NSError alloc] initWithDomain:NSOSStatusErrorDomain
                                          code:status
                                      userInfo:nil];
    }
}

#warning To be check if this method is really needed
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
