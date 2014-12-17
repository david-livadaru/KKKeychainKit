//
//  KKKeychainError.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/SecBase.h>

typedef NS_ENUM(NSInteger, KKError) {
    KKErrorOperationUnimplemented           = errSecUnimplemented,
    KKErrorInvalidParameter                 = errSecParam,
    KKErrorAllocateFailed                   = errSecAllocate,
    KKErrorKeychainNotAvailable             = errSecNotAvailable,
    KKErrorDuplicateItem                    = errSecDuplicateItem,
    KKErrorItemNotFound                     = errSecItemNotFound,
    KKErrorInteractionNotAllowed            = errSecInteractionNotAllowed,
    KKErrorDecodeFailed                     = errSecDecode,
    KKErrorAuthenticationFailed             = errSecAuthFailed
};
