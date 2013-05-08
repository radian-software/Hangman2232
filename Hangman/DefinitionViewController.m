//
//  DefinitionViewController.m
//  Hangman
//
//  Created by raxod502 on 4/27/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "DefinitionViewController.h"
#import "Package.h"

@interface DefinitionViewController ()

@end

@implementation DefinitionViewController

- (void)viewDidLoad {
    [self retrieveVariables];
    if ([self definition] != nil && [[self definition] length] >= 1) {
        [[self definitionView] setText:[self definition]];
    }
    else {
        [[self definitionView] setText:@"Definition is not available for this word."];
    }
}

- (IBAction)loadMainView:(id)sender {
    [self performSegueWithIdentifier:@"loadMainView" sender:sender];
}

- (void)globalizeVariables {
    Package *package = [[Package alloc] initWithData:[self word] :[self definition] :[self faultsAllowable] :[self wordfile] :[self callReset] :[self customWord] :[self display] :[self wins] :[self faults] :[self gameInProgress] :[self guesses] :[self score] :[self currentKeyboard] :[self stockPrice1] :[self stockPrice2] :[self stockPrice3] :[self lastPrice1] :[self lastPrice2] :[self lastPrice3] :[self stockVel1] :[self stockVel2] :[self stockVel3] :[self stockShares1] :[self stockShares2] :[self stockShares3] :[self lastDay] :[self currentDay] :[self currentDelay] :[self statusString1] :[self statusString2] :[self statusString3] :[self removeLabels]];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:package] forKey:@"package"];
}

- (void)retrieveVariables {
    Package *package = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"package"]];
    self.word = package.word;
    self.definition = package.definition;
    self.faultsAllowable = package.faultsAllowable;
    self.wordfile = package.wordfile;
    self.callReset = package.callReset;
    self.customWord = package.customWord;
    self.display = package.display;
    self.wins = package.wins;
    self.faults = package.faults;
    self.gameInProgress = package.gameInProgress;
    self.guesses = package.guesses;
    self.score = package.score;
    self.currentKeyboard = package.currentKeyboard;
    self.stockPrice1 = package.stockPrice1;
    self.stockPrice2 = package.stockPrice2;
    self.stockPrice3 = package.stockPrice3;
    self.lastPrice1 = package.lastPrice1;
    self.lastPrice2 = package.lastPrice2;
    self.lastPrice3 = package.lastPrice3;
    self.stockVel1 = package.stockVel1;
    self.stockVel2 = package.stockVel2;
    self.stockVel3 = package.stockVel3;
    self.stockShares1 = package.stockShares1;
    self.stockShares2 = package.stockShares2;
    self.stockShares3 = package.stockShares3;
    self.lastDay = package.lastDay;
    self.currentDay = package.currentDay;
    self.currentDelay = package.currentDelay;
    self.statusString1 = package.statusString1;
    self.statusString2 = package.statusString2;
    self.statusString3 = package.statusString3;
    self.removeLabels = package.removeLabels;
}


@end
