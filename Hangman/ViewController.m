//
//  ViewController.m
//  Hangman
//
//  Created by Radon Rosborough on 2/25/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import "ViewController.h"
#import "Package.h"

@interface ViewController ()

@end

@implementation ViewController

#define GDEBUG YES
#define BLANK @"_"
#define LOADDEFS YES
#define CHEATY_CASH 0

NSString *pathd = @"financedefinitions";
NSString *special = @" -'.,/";

- (IBAction)resetButtonPressed:(id)sender {
    self.word = [self loadRandomWord];
    if (GDEBUG) {
        NSLog(@"[DEBUG] %@", self.word);
    }
    self.display = [self convertToDisplay:[self word]];
    self.wins = [[NSMutableArray alloc] init];
    for (int i=0; i<[[self word] length]; i++) {
        if ([self charNotInString:special:[[self word] characterAtIndex:i]]) {
            [[self wins] addObject:@0];
        }
        else {
            [[self wins] addObject:@1];
        }
    }
    self.guesses = [[NSMutableArray alloc] init];
    for (int i=0; i<[self faultsAllowable]; i++) {
        [[self guesses] addObject:@" "];
    }
    self.faults = 0;
    self.gameInProgress = true;
    for (int i=0; i<26; i++) {
        [[[self keyboardButtons] objectAtIndex:i] setHidden:NO];
    }
    [self setRemoveLabels:[[NSMutableArray alloc] init]];
    [self updateUI];
}

- (IBAction)keyboardPressed:(id)sender {
    [self setGuess:[sender currentTitle]];
    if ([self gameInProgress]) {
        [self submitGuess:[[self guess] lowercaseString]];
        [[self removeLabels] addObject:[NSNumber numberWithInt:[[self keyboardButtons] indexOfObject:sender]]];
    }
    [self updateUI];
}

- (IBAction)loadDefinitionView:(id)sender {
    [self performSegueWithIdentifier:@"loadDefinitionView" sender:sender];
}

- (IBAction)loadSettingsView:(id)sender {
    [self performSegueWithIdentifier:@"loadSettingsView" sender:sender];
}

- (IBAction)loadSecretStockView:(id)sender {
    [self performSegueWithIdentifier:@"loadSecretStockView" sender:sender];
}

- (IBAction)loadCakeView:(id)sender {
    [self performSegueWithIdentifier:@"loadCakeView" sender:sender];
}

- (IBAction)loadAboutView:(id)sender {
    [self performSegueWithIdentifier:@"loadAboutView" sender:sender];
}

- (void)submitGuess:(NSString *)guess {
    for (int j=0; j<[guess length]; j++) {
        if ([self charNotInString:special:[guess characterAtIndex:j]]) {
            BOOL fault = true;
            unichar chars[1] = {[guess characterAtIndex:j]};
            for (int i=0; i<[[self word] length]; i++) {
                if ([guess length] > 0 && [[self word] characterAtIndex:i] == [guess characterAtIndex:j]) {
                    [[self display] replaceCharactersInRange:NSMakeRange(i*2, 1) withString:[NSString stringWithCharacters:chars length:1]];
                    fault = false;
                    [[self wins] setObject:@1 atIndexedSubscript:i];
                }
            }
            if (fault) {
                fault = true;
                for (int i=0; i<[[self guesses] count]; i++) {
                    if (chars[0] == [[[self guesses] objectAtIndex:i] characterAtIndex:0]) {
                        fault = false;
                    }
                }
                if (fault && [self faults] < [self faultsAllowable]) {
                    [[self guesses] setObject:[NSString stringWithCharacters:chars length:1] atIndexedSubscript:[self faults]];
                    self.faults += 1;
                    if ([[self wordfile] isEqualToString:@"financewords"]) {
                        self.score -= [self scrabble:guess];
                    }
                }
            }
        }
    }
}

- (NSString *)loadRandomWord {
    self.wordlist = [[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self wordfile] ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    if (LOADDEFS && [[self wordfile] isEqualToString:@"financewords"]) {
        self.deflist = [[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:pathd ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
        NSAssert([self.wordlist count] == [self.deflist count], @"Words and definitions different lengths!");
    }
    self.word = nil;
    self.definition = nil;
    if ([[self wordfile] isEqualToString:@"customword"]) {
        if ([self customWord] != nil && [[self customWord] length] >= 1 && [[self customWord] length] <= 23) {
            return [self customWord];
        }
        else {
            return @"invalid or no word";
        }
    }
    else {
        while (true) {
            int index = arc4random()%[self.wordlist count];
            NSString *loadedWord = [self.wordlist objectAtIndex:index];
            if (LOADDEFS && [[self wordfile] isEqualToString:@"financewords"]) {
                self.definition = [self.deflist objectAtIndex:index];
            }
            if ([loadedWord characterAtIndex:[loadedWord length]-1] == 13 && [loadedWord length]-1 <= 23) {
                return [loadedWord substringToIndex:[loadedWord length]-1];
            }
            else if ([loadedWord length] <= 23) {
                return loadedWord;
            }
        }
    }
}

- (NSMutableAttributedString *)convertToDisplay:(NSString *)originalWord {
    NSMutableString *display = [[NSMutableString alloc] initWithString: originalWord];
    for (int i=0; i<[display length]; i++) {
        if ([self charNotInString:special:[originalWord characterAtIndex:i]]) {
            [display replaceCharactersInRange:NSMakeRange(i, 1) withString:BLANK];
        }
        else {
            unichar chars[1] = {[originalWord characterAtIndex:i]};
            [display replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithCharacters:chars length:1]];
        }
    }
    NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:@" "];
    [space addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier" size:6] range:NSMakeRange(0, 1)];
    NSMutableAttributedString *realdisplay = [[NSMutableAttributedString alloc] init];
    for (NSInteger i=0; i<[display length]; i++) {
        if (i != 0) {
            [realdisplay appendAttributedString:space];
        }
        unichar chars[1] = {[display characterAtIndex:i]};
        [realdisplay appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithCharacters:chars length:1]]];
    }
    
    return realdisplay;
}

- (void)updateUI {
    [self setKeys:[[NSDictionary alloc] initWithObjects:[@"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" componentsSeparatedByString:@" "] forKeys:[@"Q W E R T Y U I O P A S D F G H J K L Z X C V B N M" componentsSeparatedByString:@" "]]];
    self.images = [[NSMutableArray alloc] init];
    for (int i=0; i<8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"state%i.png", i]];
        NSAssert(image, @"Could not load images.");
        [[self images] addObject:image];
    }
    [[self textField] setAttributedText:[self display]];
    NSMutableString *fstring = [NSMutableString stringWithFormat:@"Faults: %i [", [self faults]];
    for (NSInteger i=0; i<[self faultsAllowable]; i++) {
        [fstring appendFormat:@"%@", [[self guesses] objectAtIndex:i]];
    }
    [fstring appendString:@"]"];
    [[self faultField] setText:fstring];
    BOOL win = true;
    for (int i=0; i<[[self wins] count]; i++) {
        if ([[[self wins] objectAtIndex:i] isEqual: @0]) {
            win = false;
        }
    }
    [[self imageView] setImage:[[self images] objectAtIndex:MIN(7 - [self faultsAllowable] + [self faults], 7)]];
    if ([self faults] >= [self faultsAllowable]) {
        [[self statusField] setText:[NSString stringWithFormat:@"Game over! Word was\n'%@'. Try again?", [self word]]];
        self.gameInProgress = false;
    }
    else if (win) {
        [[self statusField] setText:@"You win! Try again?"];
        if ([self gameInProgress]) {
            for (int i=0; i<[[self word] length]; i++) {
                unichar chars[1] = {[[self word] characterAtIndex:i]};
                if ([[self wordfile] isEqualToString:@"financewords"]) {
                    self.score += [self scrabble:[NSString stringWithCharacters:chars length:1]]*2;
                }
            }
        }
        self.gameInProgress = false;
    }
    else {
        [[self statusField] setText:@""];
    }
    if ([self score] >= 0) {
        [[self scoreLabel] setText:[NSString stringWithFormat:@"Score: $%.2f", [self score]]];
    }
    else {
        NSMutableAttributedString *astr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Score: ($%.2f)", fabs([self score])]];
        [astr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, [astr length] - 7)];
        [[self scoreLabel] setAttributedText:astr];
    }
    [[self scoreLabel] setHidden:![[self wordfile] isEqualToString:@"financewords"]];
    for (int i=0; i<[[self removeLabels] count]; i++) {
        [[[self keyboardButtons] objectAtIndex:[[[self removeLabels] objectAtIndex:i] intValue]] setHidden:YES];
    }
    [self globalizeVariables];
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
    
    if ([self callReset]) {
        [self resetButtonPressed:nil];
        [self setCallReset:NO];
        [self globalizeVariables];
    }
    [[self viewDefinitionButton] setEnabled:[[self wordfile] isEqualToString:@"financewords"]];
}

- (void)changeButtonLabels {
    if ([self currentKeyboard]) {
        for (NSInteger i=0; i<26; i++) {
            [[[self keyboardButtons] objectAtIndex:i] setTitle:[[self keys] objectForKey:[[[[self keyboardButtons] objectAtIndex:i] titleLabel] text]] forState:UIControlStateNormal];
            [[[self keyboardButtons] objectAtIndex:i] setTitle:[[self keys] objectForKey:[[[[self keyboardButtons] objectAtIndex:i] titleLabel] text]] forState:UIControlStateSelected];
        }
        [self globalizeVariables];
    }
}

- (NSInteger)scrabble:(NSString *)letter {
    NSArray *alpha = [@"a b c d e f g h i j k l m n o p q r s t u v w x y z" componentsSeparatedByString:@" "];
    NSArray *score = [[NSArray alloc] initWithObjects:@1, @3, @3, @2, @1, @4, @3, @2, @1, @8, @5, @1, @3, @1, @1, @3, @10, @1, @1, @1, @1, @4, @4, @8, @4, @10, nil];
    if ([alpha indexOfObject:letter] != NSNotFound) {
        return [[score objectAtIndex:[alpha indexOfObject:letter]] integerValue];
    }
    else {
        return 0;
    }
}

- (BOOL)charNotInString:(NSString *)str :(unichar)c {
    for (int i=0; i<[str length]; i++) {
        if ([str characterAtIndex:i] == c) {
            return false;
        }
    }
    return true;
}

- (void)doSetup {
    [self setFaultsAllowable:7];
    [self setWordfile:@"financewords"];
    [self setCallReset:NO];
    [self setCurrentKeyboard:NO];
    [self setScore:CHEATY_CASH];
    [self resetButtonPressed:nil];
    [self globalizeVariables];
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:@"resetStocks"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [[[self navigationController] navigationBar] setHidden:NO];
    [self retrieveVariables];
    [self updateUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [self changeButtonLabels];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[[self navigationController] navigationBar] setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
