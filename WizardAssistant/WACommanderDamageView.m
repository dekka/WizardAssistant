//
//  WACommanderDamageView.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/28/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WACommanderDamageView.h"
#import "WAPlayerCell.h"
#import "WAViewController.h"


@implementation WACommanderDamageView

- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"CommanderDamage" owner:self options:nil] objectAtIndex:0];
    self.frame = frame;
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCommanderDamageView:(NSUInteger)playerCount WithCell:(WAPlayerCell *)playerCell
{
    self.commanderLabels = [NSMutableArray new];
    self.playerCell = playerCell;
    
    [self.commanderLabels addObject:self.playerOne];
    [self.commanderLabels addObject:self.playerTwo];
    [self.commanderLabels addObject:self.playerThree];
    [self.commanderLabels addObject:self.playerFour];
    [self.commanderLabels addObject:self.playerFive];
    [self.commanderLabels addObject:self.playerSix];
    
    for (int i = 0; i < playerCount; i++) {
        UILabel *label = [self.commanderLabels objectAtIndex:i];
        label.hidden = NO;
    }
    
    self.commanderDamageLabels = [NSMutableArray new];
    
    [self.commanderDamageLabels addObject:self.damageOne];
    [self.commanderDamageLabels addObject:self.damageTwo];
    [self.commanderDamageLabels addObject:self.damageThree];
    [self.commanderDamageLabels addObject:self.damageFour];
    [self.commanderDamageLabels addObject:self.damageFive];
    [self.commanderDamageLabels addObject:self.damageSix];
    
    for (int i = 0; i < playerCount; i++) {
        UILabel *label = [self.commanderDamageLabels objectAtIndex:i];
        label.hidden = NO;
    }
    
    self.commanderDamageSteppers = [NSMutableArray new];
    
    [self.commanderDamageSteppers addObject:self.stepperOne];
    [self.commanderDamageSteppers addObject:self.stepperTwo];
    [self.commanderDamageSteppers addObject:self.stepperThree];
    [self.commanderDamageSteppers addObject:self.stepperFour];
    [self.commanderDamageSteppers addObject:self.stepperFive];
    [self.commanderDamageSteppers addObject:self.stepperSix];
    
    for (int i = 0; i < playerCount; i++) {
        UIStepper *stepper = [self.commanderDamageSteppers objectAtIndex:i];
        stepper.hidden = NO;
    }
    
    for (UILabel *label in playerCell.commanderLabels)
    {
        if (!label.hidden)
        {
            NSInteger index = [playerCell.commanderLabels indexOfObject:label];
            UILabel *updateLabel = [self.commanderDamageLabels objectAtIndex:index];
            updateLabel.text = label.text;
            
        }
    }
}

- (IBAction)stepperPressed:(UIStepper *)sender
{
    UILabel *damageLabel;
    UILabel *commanderLabel;
    
    if (self.stepperOne == sender) {
        damageLabel = _damageOne;
        commanderLabel = _playerCell.commanderOne;
    } else if (self.stepperTwo == sender) {
        damageLabel = _damageTwo;
        commanderLabel = _playerCell.commanderTwo;
    } else if (self.stepperThree == sender) {
        damageLabel = _damageThree;
        commanderLabel = _playerCell.commanderThree;
    } else if (self.stepperFour == sender) {
        damageLabel = _damageFour;
        commanderLabel = _playerCell.commanderFour;
    } else if (self.stepperFive == sender) {
        damageLabel = _damageFive;
        commanderLabel = _playerCell.commanderFive;
    } else if (self.stepperSix == sender) {
        damageLabel = _damageSix;
        commanderLabel = _playerCell.commanderSix;
    }

    double value = [sender value];
    double currentValue = [damageLabel.text doubleValue];
    currentValue +=value;
    sender.value = 0;
    [damageLabel setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
    int changeInHealth = ([damageLabel.text intValue] - [commanderLabel.text intValue]);
    [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
    [commanderLabel setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
    //subtract this number from playerHealth

}

- (void)updatePlayerHealth
{
    
}

- (IBAction)closeWindow:(id)sender
{
    [UIView animateWithDuration:.3 animations:^{
        
        self.frame = CGRectMake(15, -320, 290, 290);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}




@end














