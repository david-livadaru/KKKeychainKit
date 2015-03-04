KeychainKit
===========

Keychain Kit framework aims to provide you an abstract layer over Keychain Services (at the moment for iOS, maybe in the future OS X too).

# Current version : KeychainKit Beta

Consider this release a teaser. This version is only for testing purposes, you shouldn’t use it for production.
If you’d like to see framework’s progress read the [Wiki page](https://github.com/davidlivadaru/KeychainKit/wiki).

# How to use

Keychain Kit works similar to Network API in iOS.
You create an `KKKeychainSession` and add operations to it. Any operation work with items. The items can be created only through builders. You should and you are enforced to use only this kinds of items: `KKKeychainGenericPassword` and `KKKeychainInternetPassword`. The reasons is that only these are `complete` Keychain Items.

## Create a Keychain Session

```objective-c
KKKeychainSession *keychainSession = [[KKKeychainSession alloc] init];
```

## Create a Keychain Item builder

```objective-c
KKKeychainGenericPasswordBuilder *genericPasswordBuilder = [[KKKeychainGenericPasswordBuilder alloc] initWithKeychainSession:self.keychainSession];
```

## Create a Keychain Item

Just set the properties you need.

```objective-c
genericPasswordBuilder.data = [[NSData alloc] init];
genericPasswordBuilder.service = @"domain.name.service.reversed.plus.name.of.your.specific.server";
genericPasswordBuilder.itemDescription = @"This is just an example of a keychain item.";
KKKeychainGenericPassword *genericPassword = [genericPasswordBuilder buildKeychainItem];
```

## Add an item in Keychain

```objective-c]]
KKKeychainOperation *addOperation = [KKKeychainOperation operationWithType:KKKeychainOperationTypeAdd item:genericPassword];
    [keychainSession performOperation:addOperation completionBlock:^(NSArray *items, NSError *error) {
        // check for errors
        // watch what items have been processed.
    }];
```

### Notes

If an error occurs during processing, no items are provided through block and appropriate error with specific error code and a descriptive reason. E.g. if you try to add a duplicate in Keychain, an error will be given with description  similar to:
```
Error Domain=NSOSStatusErrorDomain Code=-25299 "The operation couldn’t be completed. The specified item already exists in the keychain." UserInfo=someAddress {NSLocalizedFailureReason=The specified item already exists in the keychain.}```
The value -25299 is equal to `KKErrorDuplicateItem`. Possible errors are available in header `KKError.h`.

# Credits

The icons used in application sample were downloaded from [flaticon.com](http://www.flaticon.com).

# License

Please refer to LICENSE.md file.