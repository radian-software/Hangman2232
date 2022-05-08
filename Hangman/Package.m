//
//  Package.m
//  Hangman
//
//  Created by raxod502 on 4/28/13.
//  Copyright (c) 2013-2022 Radian LLC and contributors.
//

#import "Package.h"

@implementation Package

- (id)initWithData:(NSString *)data1 :(NSString *)data2 :(int)data3 :(NSString *)data4 :(BOOL)data5 :(NSString *)data6 :(NSMutableAttributedString *)data7 :(NSMutableArray *)data8 :(int)data9 :(BOOL)data10 :(NSMutableArray *)data11 :(CGFloat)data12 :(BOOL)data13 :(CGFloat)data14 :(CGFloat)data15 :(CGFloat)data16 :(CGFloat)data17 :(CGFloat)data18 :(CGFloat)data19 :(CGFloat)data20 :(CGFloat)data21 :(CGFloat)data22 :(NSInteger)data23 :(NSInteger)data24 :(NSInteger)data25 :(NSInteger)data26 :(NSInteger)data27 :(NSInteger)data28 :(NSString *)data29 :(NSString *)data30 :(NSString *)data31 :(NSMutableArray *)data32 {
    if (self = [super init]) {
        self.word = data1;
        self.definition = data2;
        self.faultsAllowable = data3;
        self.wordfile = data4;
        self.callReset = data5;
        self.customWord = data6;
        self.display = data7;
        self.wins = data8;
        self.faults = data9;
        self.gameInProgress = data10;
        self.guesses = data11;
        self.score = data12;
        self.currentKeyboard = data13;
        self.stockPrice1 = data14;
        self.stockPrice2 = data15;
        self.stockPrice3 = data16;
        self.lastPrice1 = data17;
        self.lastPrice2 = data18;
        self.lastPrice3 = data19;
        self.stockVel1 = data20;
        self.stockVel2 = data21;
        self.stockVel3 = data22;
        self.stockShares1 = data23;
        self.stockShares2 = data24;
        self.stockShares3 = data25;
        self.lastDay = data26;
        self.currentDay = data27;
        self.currentDelay = data28;
        self.statusString1 = data29;
        self.statusString2 = data30;
        self.statusString3 = data31;
        self.removeLabels = data32;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.word = [aDecoder decodeObjectForKey:@"word"];
        self.definition = [aDecoder decodeObjectForKey:@"definition"];
        self.faultsAllowable = [aDecoder decodeIntForKey:@"faultsAllowable"];
        self.wordfile = [aDecoder decodeObjectForKey:@"wordfile"];
        self.callReset = [aDecoder decodeBoolForKey:@"callReset"];
        self.customWord = [aDecoder decodeObjectForKey:@"customWord"];
        self.display = [aDecoder decodeObjectForKey:@"display"];
        self.wins = [aDecoder decodeObjectForKey:@"wins"];
        self.faults = [aDecoder decodeIntForKey:@"faults"];
        self.gameInProgress = [aDecoder decodeBoolForKey:@"gameInProgress"];
        self.guesses = [aDecoder decodeObjectForKey:@"guesses"];
        self.score = [aDecoder decodeFloatForKey:@"score"];
        self.currentKeyboard = [aDecoder decodeBoolForKey:@"currentKeyboard"];
        self.stockPrice1 = [aDecoder decodeFloatForKey:@"stockPrice1"];
        self.stockPrice2 = [aDecoder decodeFloatForKey:@"stockPrice2"];
        self.stockPrice3 = [aDecoder decodeFloatForKey:@"stockPrice3"];
        self.lastPrice1 = [aDecoder decodeFloatForKey:@"lastPrice1"];
        self.lastPrice2 = [aDecoder decodeFloatForKey:@"lastPrice2"];
        self.lastPrice3 = [aDecoder decodeFloatForKey:@"lastPrice3"];
        self.stockVel1 = [aDecoder decodeFloatForKey:@"stockVel1"];
        self.stockVel2 = [aDecoder decodeFloatForKey:@"stockVel2"];
        self.stockVel3 = [aDecoder decodeFloatForKey:@"stockVel3"];
        self.stockShares1 = [aDecoder decodeIntForKey:@"stockShares1"];
        self.stockShares2 = [aDecoder decodeIntForKey:@"stockShares2"];
        self.stockShares3 = [aDecoder decodeIntForKey:@"stockShares3"];
        self.lastDay = [aDecoder decodeIntForKey:@"lastDay"];
        self.currentDay = [aDecoder decodeIntForKey:@"currentDay"];
        self.currentDelay = [aDecoder decodeIntForKey:@"currentDelay"];
        self.statusString1 = [aDecoder decodeObjectForKey:@"statusString1"];
        self.statusString2 = [aDecoder decodeObjectForKey:@"statusString2"];
        self.statusString3 = [aDecoder decodeObjectForKey:@"statusString3"];
        self.removeLabels = [aDecoder decodeObjectForKey:@"removeLabels"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.word forKey:@"word"];
    [aCoder encodeObject:self.definition forKey:@"definition"];
    [aCoder encodeInt:self.faultsAllowable forKey:@"faultsAllowable"];
    [aCoder encodeObject:self.wordfile forKey:@"wordfile"];
    [aCoder encodeBool:self.callReset forKey:@"callReset"];
    [aCoder encodeObject:self.customWord forKey:@"customWord"];
    [aCoder encodeObject:self.display forKey:@"display"];
    [aCoder encodeObject:self.wins forKey:@"wins"];
    [aCoder encodeInt:self.faults forKey:@"faults"];
    [aCoder encodeBool:self.gameInProgress forKey:@"gameInProgress"];
    [aCoder encodeObject:self.guesses forKey:@"guesses"];
    [aCoder encodeFloat:self.score forKey:@"score"];
    [aCoder encodeBool:self.currentKeyboard forKey:@"currentKeyboard"];
    [aCoder encodeFloat:self.stockPrice1 forKey:@"stockPrice1"];
    [aCoder encodeFloat:self.stockPrice2 forKey:@"stockPrice2"];
    [aCoder encodeFloat:self.stockPrice3 forKey:@"stockPrice3"];
    [aCoder encodeFloat:self.lastPrice1 forKey:@"lastPrice1"];
    [aCoder encodeFloat:self.lastPrice2 forKey:@"lastPrice2"];
    [aCoder encodeFloat:self.lastPrice3 forKey:@"lastPrice3"];
    [aCoder encodeFloat:self.stockVel1 forKey:@"stockVel1"];
    [aCoder encodeFloat:self.stockVel2 forKey:@"stockVel2"];
    [aCoder encodeFloat:self.stockVel3 forKey:@"stockVel3"];
    [aCoder encodeInt:self.stockShares1 forKey:@"stockShares1"];
    [aCoder encodeInt:self.stockShares2 forKey:@"stockShares2"];
    [aCoder encodeInt:self.stockShares3 forKey:@"stockShares3"];
    [aCoder encodeInt:self.lastDay forKey:@"lastDay"];
    [aCoder encodeInt:self.currentDay forKey:@"currentDay"];
    [aCoder encodeInt:self.currentDelay forKey:@"currentDelay"];
    [aCoder encodeObject:self.statusString1 forKey:@"statusString1"];
    [aCoder encodeObject:self.statusString2 forKey:@"statusString2"];
    [aCoder encodeObject:self.statusString3 forKey:@"statusString3"];
    [aCoder encodeObject:self.removeLabels forKey:@"removeLabels"];
}

@end
