//
//  ViewController.h
//  Hangman
//
//  Created by Radon Rosborough on 2/25/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *textField;
@property (weak, nonatomic) IBOutlet UITextView *statusField;
@property (weak, nonatomic) IBOutlet UILabel *faultField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewDefinitionButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keyboardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic) NSArray *wordlist;
@property (nonatomic) NSArray *deflist;
@property (nonatomic) NSString *guess;
@property (nonatomic) NSString *word;
@property (nonatomic) NSString *definition;
@property (nonatomic) NSMutableAttributedString *display;
@property (nonatomic) NSMutableArray *wins;
@property (nonatomic) NSMutableArray *guesses;
@property (nonatomic) int faults;
@property (nonatomic) BOOL gameInProgress;
@property (nonatomic) NSMutableArray *images;
@property (nonatomic) int faultsAllowable;
@property (nonatomic) NSString *wordfile;
@property (nonatomic) BOOL callReset;
@property (nonatomic) NSString *customWord;
@property (nonatomic) NSDictionary *keys;
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

- (IBAction)resetButtonPressed:(id)sender;

- (IBAction)keyboardPressed:(id)sender;

- (IBAction)loadDefinitionView:(id)sender;
- (IBAction)loadSettingsView:(id)sender;
- (IBAction)loadSecretStockView:(id)sender;
- (IBAction)loadCakeView:(id)sender;
- (IBAction)loadAboutView:(id)sender;

- (void)submitGuess:(NSString *)guess;
- (NSString *)loadRandomWord;
- (NSMutableAttributedString *)convertToDisplay:(NSString *)word;
- (void)updateUI;
- (void)globalizeVariables;
- (void)retrieveVariables;
- (void)changeButtonLabels;
- (NSInteger)scrabble:(NSString *)letter;
- (BOOL)charNotInString:(NSString *)str :(unichar)c;
- (void)doSetup;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)didReceiveMemoryWarning;

@end
