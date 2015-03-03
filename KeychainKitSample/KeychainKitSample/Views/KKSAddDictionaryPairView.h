//
//  KKSAddDictionaryPairView.h
//  KeychainKitSample
//
//  Created by david on 20/02/15.
//

#import <UIKit/UIKit.h>

@class KKSAddDictionaryPairView;

@protocol KKSAddDictionaryPairViewDelegate <NSObject>

- (void)addDictionaryPairViewButtonPressed:(KKSAddDictionaryPairView *)addDictionaryPairView;

@end

@interface KKSAddDictionaryPairView : UIView

@property (nonatomic, readonly) NSString *keyString;
@property (nonatomic, readonly) NSString *objectString;
@property (nonatomic, weak) id<KKSAddDictionaryPairViewDelegate> delegate;

@end
