//
//  KKKeychainError.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//

#import <Foundation/Foundation.h>
#import <Security/SecBase.h>

/*!
 *  Error codes used when an operation fails.
 *  @see https://developer.apple.com/library/mac/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/uid/TP30000898-CH5g-CJBEABHG  official documentation.
 */
typedef NS_ENUM(NSInteger, KKError){
    KKErrorOperationUnimplemented           = errSecUnimplemented,
    KKErrorInputOutput                      = errSecIO,
    KKErrorWritePermission                  = errSecOpWr,
    KKErrorInvalidParameter                 = errSecParam,
    KKErrorAllocateFailed                   = errSecAllocate,
    KKErrorUserCanceled                     = errSecUserCanceled,
    KKErrorBadRequest                       = errSecBadReq,
    /*!
     *  An error occured while processing request.
     */
    KKErrorInternalError                    = errSecInternalComponent,
    KKErrorKeychainNotAvailable             = errSecNotAvailable,
    KKErrorDuplicateItem                    = errSecDuplicateItem,
    KKErrorItemNotFound                     = errSecItemNotFound,
    KKErrorInteractionNotAllowed            = errSecInteractionNotAllowed,
    KKErrorDecodeFailed                     = errSecDecode,
    KKErrorAuthenticationFailed             = errSecAuthFailed
};
