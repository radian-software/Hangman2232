//
//  AboutViewController.m
//  Hangman
//
//  Created by raxod502 on 5/4/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (IBAction)loadMainView:(id)sender {
    [self performSegueWithIdentifier:@"loadMainView" sender:sender];
}

@end
