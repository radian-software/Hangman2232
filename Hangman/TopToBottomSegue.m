//
//  TopToBottomSegue.m
//  Hangman
//
//  Created by Radon Rosborough on 5/3/13.
//  Copyright (c) 2013-2022 Radian LLC and contributors.
//

#import "TopToBottomSegue.h"

@implementation TopToBottomSegue

- (void)perform {
    CATransition *trans = [CATransition animation];
    [trans setDuration:0.25];
    [trans setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [trans setType:kCATransitionPush];
    [trans setSubtype:kCATransitionFromBottom];
    [[[[[self sourceViewController] navigationController] view] layer] addAnimation:trans forKey:kCATransition];
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
