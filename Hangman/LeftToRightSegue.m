//
//  LeftToRightSegue.m
//  Hangman
//
//  Created by raxod502 on 4/28/13.
//  Copyright (c) 2013-2022 Radian LLC and contributors.
//

#import "LeftToRightSegue.h"

@implementation LeftToRightSegue

- (void)perform {
    CATransition *trans = [CATransition animation];
    [trans setDuration:0.25];
    [trans setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [trans setType:kCATransitionPush];
    [trans setSubtype:kCATransitionFromLeft];
    [[[[[self sourceViewController] navigationController] view] layer] addAnimation:trans forKey:kCATransition];
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
