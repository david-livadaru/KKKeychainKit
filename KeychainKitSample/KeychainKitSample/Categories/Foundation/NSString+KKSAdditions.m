//
//  NSString+KKSAdditions.m
//  KeychainKitSample
//
//  Created by david on 24/02/15.
//  Copyright (c) 2015 David Live Org. All rights reserved.
//

#import "NSString+KKSAdditions.h"

@implementation NSString (KKSAdditions)

- (NSUInteger)lengthByRemovingWhiteSpaceAndNewLineCharacters {
    NSCharacterSet *whiteSpaceAndNewLineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *selfWithNoWhiteSpaceOrNewLine = [self stringByTrimmingCharactersInSet:whiteSpaceAndNewLineCharacterSet];
    return [selfWithNoWhiteSpaceOrNewLine length];
}

@end
