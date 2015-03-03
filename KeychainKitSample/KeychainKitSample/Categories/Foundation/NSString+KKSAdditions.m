//
//  NSString+KKSAdditions.m
//  KeychainKitSample
//
//  Created by david on 24/02/15.
//

#import "NSString+KKSAdditions.h"

@implementation NSString (KKSAdditions)

- (NSUInteger)lengthByRemovingWhiteSpaceAndNewLineCharacters {
    NSCharacterSet *whiteSpaceAndNewLineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *selfWithNoWhiteSpaceOrNewLine =
    [self stringByTrimmingCharactersInSet:whiteSpaceAndNewLineCharacterSet];
    return [selfWithNoWhiteSpaceOrNewLine length];
}

@end
