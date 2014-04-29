//
//  WAPlayerCell.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WAPlayerCell.h"

@implementation WAPlayerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setupCommanderDamageWithPlayerCount:(int)playerCount
{
    self.commanderLabels = [NSMutableArray new];
    
    [self.commanderLabels addObject:self.commanderOne];
    [self.commanderLabels addObject:self.commanderTwo];
    [self.commanderLabels addObject:self.commanderThree];
    [self.commanderLabels addObject:self.commanderFour];
    [self.commanderLabels addObject:self.commanderFive];
    [self.commanderLabels addObject:self.commanderSix];
    
    //NSLog(@"commanders: %d",self.commanderLabels.count);

    for (int i = 0; i < playerCount; i++) {
        UILabel *label = [self.commanderLabels objectAtIndex:i];
        label.hidden = NO;
    }
    
}

@end




