//
//  DefinitionViewController.h
//  Hangman
//
//  Created by raxod502 on 4/27/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefinitionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *definitionView;

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

- (IBAction)loadMainView:(id)sender;

- (void)globalizeVariables;
- (void)retrieveVariables;

@end
