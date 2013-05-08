//
//  CakeViewController.m
//  Hangman
//
//  Created by raxod502 on 5/4/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "CakeViewController.h"

@interface CakeViewController ()

@end

@implementation CakeViewController

- (IBAction)loadMainView:(id)sender {
    [self performSegueWithIdentifier:@"loadMainView" sender:sender];
}

- (IBAction)resetStocks:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:@"resetStocks"];
}

@end
