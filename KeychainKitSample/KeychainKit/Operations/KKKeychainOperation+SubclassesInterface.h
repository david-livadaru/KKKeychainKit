//
//  KKKeychainOperation+SubclassesInterface.h
//  KeychainKitSample
//
//  Created by david on 10/02/15.
//

#import <KeychainKit/KeychainKit.h>
@import Security;

@interface KKKeychainOperation (SubclassesInterface)

- (instancetype)initWithOperationType:(KKKeychainOperationType)operationType item:(KKKeychainItem *)item
NS_REQUIRES_SUPER;

- (OSStatus)executeOperationWithAttributes:(NSDictionary *)attributes result:(CFTypeRef *)result;

@end
