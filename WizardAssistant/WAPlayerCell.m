//
//  WAPlayerCell.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WAPlayerCell.h"
#import "WACommanderDamage.h"


@implementation WAPlayerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setupCommanderDamageWithPlayerCount:(int)playerCount AndPlayer:(WAPlayer *)player atIndexPath:(NSIndexPath *)indexPath;
{
    
    self.playerName.text = player.name;
    self.playerHealth.text = [NSString stringWithFormat:@"%ld",(long)player.health];
    self.poisonDamage.text = [NSString stringWithFormat:@"%ld",(long)player.poisonDamageTaken];
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
        label.text = [NSString stringWithFormat:@"%ld",(long)[player.commanderDamages[i] damage]];
    }
    self.poisonDamage.hidden = YES;
    
    self.panelView.colorScheme = indexPath.row;
}

- (void)setupStandardFormatCellsWithPlayer:(WAPlayer *)player atIndexPath:(NSIndexPath *)indexPath;
{
    self.playerName.text = player.name;
    self.playerHealth.text = [NSString stringWithFormat:@"%ld",(long)player.health];
    self.poisonDamage.text = [NSString stringWithFormat:@"%ld",(long)player.poisonDamageTaken];
    self.commanderLabels = [NSMutableArray new];
    
    [self.commanderLabels addObject:self.commanderOne];
    [self.commanderLabels addObject:self.commanderTwo];
    [self.commanderLabels addObject:self.commanderThree];
    [self.commanderLabels addObject:self.commanderFour];
    [self.commanderLabels addObject:self.commanderFive];
    [self.commanderLabels addObject:self.commanderSix];
    
    for (UILabel *label in self.commanderLabels)
    {
        label.hidden = YES;
    }
    self.poisonDamage.hidden = YES;
    self.panelView.colorScheme = indexPath.row;


}

@end











