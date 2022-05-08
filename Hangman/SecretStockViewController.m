//
//  SecretStockViewController.m
//  Hangman
//
//  Created by Radon Rosborough on 5/3/13.
//  Copyright (c) 2013-2022 Radian LLC and contributors.
//

#import "SecretStockViewController.h"

#define clamp(a, b, c) MAX(MIN(b, c), a)

@interface SecretStockViewController ()

@end

@implementation SecretStockViewController

// Stock 1 is relatively normal.
// Stock 2 is relatively stable.
// Stock 3 is relatively unstable.

- (IBAction)stockInvested1:(id)sender {
    if ([(UIStepper *)sender value] > [self stockShares1]) {
        if ([self score] - [self stockPrice1] >= 0) {
            [self setScore:[self score] - [self stockPrice1]];
        }
        else {
            [(UIStepper *)sender setValue:[self stockShares1]];
        }
    }
    if ([(UIStepper *)sender value] < [self stockShares1]) {
        [self setScore:[self score] + [self stockPrice1]];
    }
    [self setStockShares1:[(UIStepper *)sender value]];
    [self updateUI];
}

- (IBAction)stockInvested2:(id)sender {
    if ([(UIStepper *)sender value] > [self stockShares2]) {
        if ([self score] - [self stockPrice2] >= 0) {
            [self setScore:[self score] - [self stockPrice2]];
        }
        else {
            [(UIStepper *)sender setValue:[self stockShares2]];
        }
    }
    if ([(UIStepper *)sender value] < [self stockShares2]) {
        [self setScore:[self score] + [self stockPrice2]];
    }
    [self setStockShares2:[(UIStepper *)sender value]];
    [self updateUI];
}

- (IBAction)stockInvested3:(id)sender {
    if ([(UIStepper *)sender value] > [self stockShares3]) {
        if ([self score] - [self stockPrice3] >= 0) {
            [self setScore:[self score] - [self stockPrice3]];
        }
        else {
            [(UIStepper *)sender setValue:[self stockShares3]];
        }
    }
    if ([(UIStepper *)sender value] < [self stockShares3]) {
        [self setScore:[self score] + [self stockPrice3]];
    }
    [self setStockShares3:[(UIStepper *)sender value]];
    [self updateUI];
}

- (IBAction)delayChanged:(id)sender {
    [self setCurrentDelay:[(UIStepper *)sender value]];
    [[self waitButton] setTitle:[NSString stringWithFormat:@"Wait %.0f day%@", [(UIStepper *)sender value], [self pluralStr:[(UIStepper *)sender value]]] forState:UIControlStateNormal];
    [[self waitButton] setTitle:@"Wait %i day%@" forState:UIControlStateSelected];
}

- (IBAction)simulateStocks:(id)sender {
    [self setLastDay:[self currentDay]];
    [self setLastPrice1:[self stockPrice1]];
    [self setLastPrice2:[self stockPrice2]];
    [self setLastPrice3:[self stockPrice3]];
    for (int i=0; i<[self currentDelay]; i++) {
        [self setCurrentDay:[self currentDay]+1];
        [self setStockVel1:clamp(0.90, [self stockVel1]*[self randomBetween:0.95 :1.0/0.95], 1.0/0.90)];
        if ([self stockVel1] > 1.025) {
            [self setStockVel1:[self stockVel1]*0.98];
        }
        if ([self stockVel1] < 1/1.025) {
            [self setStockVel1:[self stockVel1]/0.98];
        }
        [self setStockPrice1:[self stockPrice1]*[self stockVel1]];

        [self setStockVel2:clamp(0.95, [self stockVel2]*[self randomBetween:0.975 :1.0/0.975], 1.0/0.95)];
        if ([self stockVel2] > 1.025) {
            [self setStockVel2:[self stockVel2]*0.96];
        }
        if ([self stockVel2] < 1/1.025) {
            [self setStockVel2:[self stockVel2]/0.96];
        }
        [self setStockPrice2:[self stockPrice2]*[self stockVel2]];

        [self setStockVel3:clamp(0.80, [self stockVel3]*[self randomBetween:0.90 :1.0/0.90], 1.0/0.80)];
        if ([self stockVel3] > 1.025) {
            [self setStockVel3:[self stockVel3]*0.96];
        }
        if ([self stockVel3] < 1/1.025) {
            [self setStockVel3:[self stockVel3]/0.96];
        }
        [self setStockPrice3:[self stockPrice3]*[self stockVel3]];

        [self setStockPrice1:[self stockPrice1]+(20-[self stockPrice1])*0.01];
        [self setStockPrice2:[self stockPrice2]+(20-[self stockPrice2])*0.01];
        [self setStockPrice3:[self stockPrice3]+(20-[self stockPrice3])*0.01];
    }
    [self updateUIWithStockStatus];
}

- (IBAction)loadMainView:(id)sender {
    [self performSegueWithIdentifier:@"loadMainView" sender:sender];
}

- (void)updateUI {
    [[self stockStepper1] setValue:[self stockShares1]];
    [[self stockStepper2] setValue:[self stockShares2]];
    [[self stockStepper3] setValue:[self stockShares3]];
    [[self waitStepper] setValue:[self currentDelay]];
    if ([self score] >= 0) {
        [[self scoreLabel] setText:[NSString stringWithFormat:@"Money: $%.2f", [self score]]];
    }
    else {
        NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Money: ($%.2f)", fabs([self score])]];
        [astr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, [astr length] - 7)];
        [[self scoreLabel] setAttributedText:astr];
    }
    [[self nameLabel1] setText:[NSString stringWithFormat:@"NIS [$%.2f]", [self stockPrice1]]];
    [[self nameLabel2] setText:[NSString stringWithFormat:@"SOC [$%.2f]", [self stockPrice2]]];
    [[self nameLabel3] setText:[NSString stringWithFormat:@"NAT [$%.2f]", [self stockPrice3]]];
    [[self investLabel1] setText:[NSString stringWithFormat:@"Invested: $%.2f", [self stockPrice1] * [self stockShares1]]];
    [[self investLabel2] setText:[NSString stringWithFormat:@"Invested: $%.2f", [self stockPrice2] * [self stockShares2]]];
    [[self investLabel3] setText:[NSString stringWithFormat:@"Invested: $%.2f", [self stockPrice3] * [self stockShares3]]];
    [[self sharesLabel1] setText:[NSString stringWithFormat:@"Shares: %i", [self stockShares1]]];
    [[self sharesLabel2] setText:[NSString stringWithFormat:@"Shares: %i", [self stockShares2]]];
    [[self sharesLabel3] setText:[NSString stringWithFormat:@"Shares: %i", [self stockShares3]]];
    [[self stockStatus1] setText:[self statusString1]];
    [[self stockStatus2] setText:[self statusString2]];
    [[self stockStatus3] setText:[self statusString3]];
}

- (void)updateUIWithStockStatus {
    NSString *str1 = [NSString stringWithFormat:@"In the last %i day%@, value per share of NIS stock %@ from $%.2f to $%.2f, causing your $%.2f invested to become $%.2f. You %@ $%.2f.", [self currentDay] - [self lastDay], [self pluralStr:[self currentDay] - [self lastDay]], [self changeStr:[self lastPrice1] :[self stockPrice1]], [self lastPrice1], [self stockPrice1], [self lastPrice1] * [self stockShares1], [self stockPrice1] * [self stockShares1], [self diffStr:[self lastPrice1] :[self stockPrice1]], fabs([self lastPrice1] - [self stockPrice1])*[self stockShares1]];
    NSString *str2 = [NSString stringWithFormat:@"In the last %i day%@, value per share of SOC stock %@ from $%.2f to $%.2f, causing your $%.2f invested to become $%.2f. You %@ $%.2f.", [self currentDay] - [self lastDay], [self pluralStr:[self currentDay] - [self lastDay]], [self changeStr:[self lastPrice2] :[self stockPrice2]], [self lastPrice2], [self stockPrice2], [self lastPrice2] * [self stockShares2], [self stockPrice2] * [self stockShares2], [self diffStr:[self lastPrice2] :[self stockPrice2]], fabs([self lastPrice2] - [self stockPrice2])*[self stockShares2]];
    NSString *str3 = [NSString stringWithFormat:@"In the last %i day%@, value per share of NAT stock %@ from $%.2f to $%.2f, causing your $%.2f invested to become $%.2f. You %@ $%.2f.", [self currentDay] - [self lastDay], [self pluralStr:[self currentDay] - [self lastDay]], [self changeStr:[self lastPrice3] :[self stockPrice3]], [self lastPrice3], [self stockPrice3], [self lastPrice3] * [self stockShares3], [self stockPrice3] * [self stockShares3], [self diffStr:[self lastPrice3] :[self stockPrice3]], fabs([self lastPrice3] - [self stockPrice3])*[self stockShares3]];
    [self setStatusString1:str1];
    [self setStatusString2:str2];
    [self setStatusString3:str3];
    [self updateUI];
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


- (void)viewWillAppear:(BOOL)animated {
    [self retrieveVariables];
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"resetStocks"] boolValue] == 1) {
        [self setStockPrice1:20];
        [self setStockPrice2:20];
        [self setStockPrice3:20];
        [self setLastPrice1:20];
        [self setLastPrice2:20];
        [self setLastPrice3:20];
        [self setStockVel1:1];
        [self setStockVel2:1];
        [self setStockVel3:1];
        [self setStockShares1:0];
        [self setStockShares2:0];
        [self setStockShares3:0];
        [self setLastDay:0];
        [self setCurrentDay:0];
        [self setCurrentDelay:1];
        [self setStatusString1:[NSString stringWithFormat:@"The current value per share of NIS stock is $%.2f.", [self stockPrice1]]];
        [self setStatusString2:[NSString stringWithFormat:@"The current value per share of SOC stock is $%.2f.", [self stockPrice2]]];
        [self setStatusString3:[NSString stringWithFormat:@"The current value per share of NAT stock is $%.2f.", [self stockPrice3]]];
        [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"resetStocks"];
    }
    [self updateUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self globalizeVariables];
}

- (NSString *)changeStr:(CGFloat)before :(CGFloat)after {
    if (before < after) {
        return @"increased";
    }
    else if (before > after) {
        return @"decreased";
    }
    else if (before == after) {
        return @"remained constant";
    }
    else {
        return @"failed to calculate correctly";
    }
}

- (NSString *)diffStr:(CGFloat)before :(CGFloat)after {
    if (before < after) {
        return @"made";
    }
    else if (before > after) {
        return @"lost";
    }
    else if (before == after) {
        return @"made";
    }
    else {
        return @"failed to calculate correctly";
    }
}

- (NSString *)pluralStr:(NSInteger)n {
    if (n == 1) {
        return @"";
    }
    else {
        return @"s";
    }
}

- (CGFloat)randomBetween:(CGFloat)a :(CGFloat)b {
    CGFloat rand = arc4random() / INT_MAX;
    rand *= (b - a);
    rand += a;
    return rand;
}

@end
