//
//  RightToLeftSegue.m
//  Hangman
//
//  Created by raxod502 on 4/28/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "RightToLeftSegue.h"

@implementation RightToLeftSegue

- (void)perform {
    CATransition *trans = [CATransition animation];
    [trans setDuration:0.25];
    [trans setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [trans setType:kCATransitionPush];
    [trans setSubtype:kCATransitionFromRight];
    [[[[[self sourceViewController] navigationController] view] layer] addAnimation:trans forKey:kCATransition];
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
