//
//  Package.h
//  Hangman
//
//  Created by raxod502 on 4/28/13.
//  Copyright (c) 2013 Raxod502. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Package : NSObject <NSCoding>

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

- (id)initWithData:(NSString *)data1 :(NSString *)data2 :(int)data3 :(NSString *)data4 :(BOOL)data5 :(NSString *)data6 :(NSMutableAttributedString *)data7 :(NSMutableArray *)data8 :(int)data9 :(BOOL)data10 :(NSMutableArray *)data11 :(CGFloat)data12 :(BOOL)data13 :(CGFloat)data14 :(CGFloat)data15 :(CGFloat)data16 :(CGFloat)data17 :(CGFloat)data18 :(CGFloat)data19 :(CGFloat)data20 :(CGFloat)data21 :(CGFloat)data22 :(NSInteger)data23 :(NSInteger)data24 :(NSInteger)data25 :(NSInteger)data26 :(NSInteger)data27 :(NSInteger)data28 :(NSString *)data29 :(NSString *)data30 :(NSString *)data31 :(NSMutableArray *)data32;
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

@end
