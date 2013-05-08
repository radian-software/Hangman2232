//
//  SecretStockViewController.h
//  Hangman
//
//  Created by Radon Rosborough on 5/3/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Package.h"

@interface SecretStockViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *investLabel1;
@property (weak, nonatomic) IBOutlet UILabel *investLabel2;
@property (weak, nonatomic) IBOutlet UILabel *investLabel3;
@property (weak, nonatomic) IBOutlet UILabel *sharesLabel1;
@property (weak, nonatomic) IBOutlet UILabel *sharesLabel2;
@property (weak, nonatomic) IBOutlet UILabel *sharesLabel3;
@property (weak, nonatomic) IBOutlet UITextView *stockStatus1;
@property (weak, nonatomic) IBOutlet UITextView *stockStatus2;
@property (weak, nonatomic) IBOutlet UITextView *stockStatus3;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel1;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel2;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel3;
@property (weak, nonatomic) IBOutlet UIButton *waitButton;
@property (weak, nonatomic) IBOutlet UIStepper *stockStepper1;
@property (weak, nonatomic) IBOutlet UIStepper *stockStepper2;
@property (weak, nonatomic) IBOutlet UIStepper *stockStepper3;
@property (weak, nonatomic) IBOutlet UIStepper *waitStepper;

@property (nonatomic) NSString *word;
@property (nonatomic) NSString *definition;
@property (nonatomic) int faultsAllowable;
@property (nonatomic) NSString *wordfile;
@property (nonatomic) BOOL callReset;
@property (nonatomic) NSString *customWord;
@property (nonatomic) NSMutableAttributedString *display;
@property (nonatomic) NSMutableArray *wins;
@property (nonatomic) int faults;
@property (nonatomic) BOOL gameInProgress;
@property (nonatomic) NSMutableArray *guesses;
@property (nonatomic) CGFloat score;
@property (nonatomic) BOOL currentKeyboard;

@property (nonatomic) CGFloat stockPrice1;
@property (nonatomic) CGFloat stockPrice2;
@property (nonatomic) CGFloat stockPrice3;
@property (nonatomic) CGFloat lastPrice1;
@property (nonatomic) CGFloat lastPrice2;
@property (nonatomic) CGFloat lastPrice3;
@property (nonatomic) CGFloat stockVel1;
@property (nonatomic) CGFloat stockVel2;
@property (nonatomic) CGFloat stockVel3;
@property (nonatomic) NSInteger stockShares1;
@property (nonatomic) NSInteger stockShares2;
@property (nonatomic) NSInteger stockShares3;
@property (nonatomic) NSInteger lastDay;
@property (nonatomic) NSInteger currentDay;
@property (nonatomic) NSInteger currentDelay;
@property (nonatomic) NSString *statusString1;
@property (nonatomic) NSString *statusString2;
@property (nonatomic) NSString *statusString3;
@property (nonatomic) NSMutableArray *removeLabels;

- (IBAction)stockInvested1:(id)sender;
- (IBAction)stockInvested2:(id)sender;
- (IBAction)stockInvested3:(id)sender;
- (IBAction)delayChanged:(id)sender;
- (IBAction)simulateStocks:(id)sender;

- (IBAction)loadMainView:(id)sender;

- (void)updateUI;
- (void)updateUIWithStockStatus;
- (void)globalizeVariables;
- (void)retrieveVariables;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (NSString *)changeStr:(CGFloat)before :(CGFloat)after;
- (NSString *)diffStr:(CGFloat)before :(CGFloat)after;
- (NSString *)pluralStr:(NSInteger)n;
- (CGFloat)randomBetween:(CGFloat)a :(CGFloat)b;

@end
