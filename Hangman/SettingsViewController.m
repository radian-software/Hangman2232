//
//  SettingsViewController.m
//  Hangman
//
//  Created by raxod502 on 4/27/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "SettingsViewController.h"
#import "Package.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController


- (IBAction)loadMainView:(id)sender {
    [self performSegueWithIdentifier:@"loadMainView" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self retrieveVariables];
    [[self faultsCounter] setValue:[self faultsAllowable]];
    [self setFaultsAllowable:[[self faultsCounter] value]];
    [[self faultsCounterLabel] setText:[NSString stringWithFormat:@"Faults allowed: %i", [self faultsAllowable]]];
    [[self keyboardSwitch] setOn:[self currentKeyboard]];
    if ([[self wordfile] isEqualToString:@"financewords"]) {
        [[self wordfilePanel] setSelectedSegmentIndex:0];
    }
    else if ([[self wordfile] isEqualToString:@"words"]) {
        [[self wordfilePanel] setSelectedSegmentIndex:1];
    }
    else if ([[self wordfile] isEqualToString:@"hardwords"]) {
        [[self wordfilePanel] setSelectedSegmentIndex:2];
    }
    else if ([[self wordfile] isEqualToString:@"customword"]) {
        [[self wordfilePanel] setSelectedSegmentIndex:3];
    }
    else {
        NSAssert(false, @"Word file came out of sync, so to speak.");
    }
    [[self customWordField] setText:[self customWord]];
    [[self customWordField] setHidden:![[self wordfile] isEqualToString:@"customword"]];
    [self globalizeVariables];
}

- (BOOL)textFieldShouldReturn:(UITextField *)tf {
    if (tf == [self customWordField]) {
        [tf resignFirstResponder];
        [self setCustomWord:[tf text]];
        [self setCallReset:YES];
        [self globalizeVariables];
    }
    return YES;
}

- (IBAction)faultNumberChanged:(id)sender {
    [self setFaultsAllowable:[[self faultsCounter] value]];
    [[self faultsCounterLabel] setText:[NSMutableString stringWithFormat:@"Faults allowed: %i", [self faultsAllowable]]];
    [self setCallReset:YES];
    [self globalizeVariables];
}

- (IBAction)wordFileChanged:(id)sender {
    [[self customWordField] setHidden:YES];
    switch ([[self wordfilePanel] selectedSegmentIndex]) {
        case 0:
            [self setWordfile:@"financewords"];
            [[self customWordField] resignFirstResponder];
            break;
        case 1:
            [self setWordfile:@"words"];
            [[self customWordField] resignFirstResponder];
            break;
        case 2:
            [self setWordfile:@"hardwords"];
            [[self customWordField] resignFirstResponder];
            break;
        case 3:
            [self setWordfile:@"customword"];
            [[self customWordField] setHidden:NO];
            break;
        default:
            NSAssert(false, @"Invalid word file selected... somehow.");
    }
    [self setCallReset:YES];
    [self globalizeVariables];
}

- (IBAction)keyboardSwitched:(id)sender {
    [self setCurrentKeyboard:[[self keyboardSwitch] isOn]];
    [self setCallReset:YES];
    [self globalizeVariables];
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([[self wordfilePanel] selectedSegmentIndex] == 3) {
        [self textFieldShouldReturn:[self customWordField]];
    }
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
