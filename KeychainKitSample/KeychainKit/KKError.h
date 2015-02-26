//
//  KKKeychainError.h
//  KeychainKitSample
//
//  Created by david on 17/12/14.
//  Copyright (c) 2014 David Live Org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/SecBase.h>

/*!
 *  Error codes used when an operation fails.
 */
typedef NS_ENUM(NSInteger, KKError){
    /*!
     *  Function or operation not implemented.
     */
    KKErrorOperationUnimplemented           = errSecUnimplemented,
    /*!
     *  Input/ouput error.
     */
    KKErrorInputOutput                      = errSecIO,
    /*!
     *  File already open with write permission.
     */
    KKErrorWritePermission                  = errSecOpWr,
    /*!
     *  One or more parameters passed to the function were not valid.
     */
    KKErrorInvalidParameter                 = errSecParam,
    /*!
     *  Failed to allocate memory.
     */
    KKErrorAllocateFailed                   = errSecAllocate,
    /*!
     *  User canceled the operation.
     */
    KKErrorUserCanceled                     = errSecUserCanceled,
    /*!
     *  Bad parameter or invalid state for operation.
     */
    KKErrorBadRequest                       = errSecBadReq,
    /*!
     *  An error occured while processing request.
     */
    KKErrorInternalError                    = errSecInternalComponent,
    /*!
     *  No trust results are available.
     */
    KKErrorKeychainNotAvailable             = errSecNotAvailable,
    /*!
     *  The item already exists.
     */
    KKErrorDuplicateItem                    = errSecDuplicateItem,
    /*!
     *  The item cannot be found.
     */
    KKErrorItemNotFound                     = errSecItemNotFound,
    /*!
     *  Interaction with the Security Server is not allowed.
     */
    KKErrorInteractionNotAllowed            = errSecInteractionNotAllowed,
    /*!
     *  Unable to decode the provided data.
     */
    KKErrorDecodeFailed                     = errSecDecode,
    /*!
     *  Authorization/Authentication failed.
     */
    KKErrorAuthenticationFailed             = errSecAuthFailed
};
