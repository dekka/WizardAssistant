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
#import "WASettingsViewController.h"
#import "WAPlayer.h"
#import "WACommanderDamage.h"



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

- (void)setupCommanderDamageView:(NSMutableArray *)players WithCell:(WAPlayerCell *)playerCell andPlayer:(WAPlayer *)player andWithDimView:(UIView *)dimView
{
    self.commanderLabels = [NSMutableArray new];
    self.playerCell = playerCell;
    self.dimView = dimView;
    self.selectedPlayer = player;
    
    [self.commanderLabels addObject:self.playerOne];
    [self.commanderLabels addObject:self.playerTwo];
    [self.commanderLabels addObject:self.playerThree];
    [self.commanderLabels addObject:self.playerFour];
    [self.commanderLabels addObject:self.playerFive];
    [self.commanderLabels addObject:self.playerSix];
    
    for (int i = 0; i < players.count; i++) {
        UILabel *label = [self.commanderLabels objectAtIndex:i];
        label.hidden = NO;
        label.text = [[players objectAtIndex:i] name];
    }
    
    self.commanderDamageLabels = [NSMutableArray new];
    
    [self.commanderDamageLabels addObject:self.damageOne];
    [self.commanderDamageLabels addObject:self.damageTwo];
    [self.commanderDamageLabels addObject:self.damageThree];
    [self.commanderDamageLabels addObject:self.damageFour];
    [self.commanderDamageLabels addObject:self.damageFive];
    [self.commanderDamageLabels addObject:self.damageSix];
    
    for (int i = 0; i < players.count; i++) {
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
    
    for (int i = 0; i < players.count; i++) {
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
    
    if (self.poisonDamage)
    {
        self.poisonDamage.text = self.playerCell.poisonDamage.text;
    }
    
//    [_playerOne setText:@"%@", playerCell.playerName];

  
        
}

- (IBAction)stepperPressed:(UIStepper *)sender
{
    UILabel *damageLabel;
    UILabel *commanderLabel;
    NSInteger stepperNumber;
    if (self.stepperOne == sender) {
        damageLabel = _damageOne;
        commanderLabel = _playerCell.commanderOne;
        stepperNumber = 0;
    } else if (self.stepperTwo == sender) {
        damageLabel = _damageTwo;
        commanderLabel = _playerCell.commanderTwo;
        stepperNumber = 1;
    } else if (self.stepperThree == sender) {
        damageLabel = _damageThree;
        commanderLabel = _playerCell.commanderThree;
        stepperNumber = 2;
    } else if (self.stepperFour == sender) {
        damageLabel = _damageFour;
        commanderLabel = _playerCell.commanderFour;
        stepperNumber = 3;
    } else if (self.stepperFive == sender) {
        damageLabel = _damageFive;
        commanderLabel = _playerCell.commanderFive;
        stepperNumber = 4;
    } else if (self.stepperSix == sender) {
        damageLabel = _damageSix;
        commanderLabel = _playerCell.commanderSix;
        stepperNumber = 5;
    }

    double value = [sender value];
    double currentValue = [damageLabel.text doubleValue];
    currentValue +=value;
    sender.value = 0;
    [damageLabel setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
    int changeInHealth = ([damageLabel.text intValue] - [commanderLabel.text intValue]);
    [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
    [commanderLabel setText:[NSString stringWithFormat:@"%d", (int)currentValue]];

    WACommanderDamage *cmdDamage = self.selectedPlayer.commanderDamages[stepperNumber];
    
    cmdDamage.damage += value;
    
    //subtract this number from playerHealth

}

- (IBAction)poisonStepperPressed:(UIStepper *)sender
{
    double poisonValue = [sender value];
    double currentPoisonValue = [self.poisonDamage.text doubleValue];
    currentPoisonValue += poisonValue;
    sender.value = 0;
    [self.poisonDamage setText:[NSString stringWithFormat:@"%d", (int)currentPoisonValue]];
    [self.playerCell.poisonDamage setText:[NSString stringWithFormat:@"%d",(int)currentPoisonValue]];
    self.playerCell.poisonDamage.hidden = NO;
    self.selectedPlayer.poisonDamageTaken = currentPoisonValue;
}


- (IBAction)closeWindow:(id)sender
{
    [UIView animateWithDuration:.3 animations:^{
        
        self.frame = CGRectMake(15, -344, 290, 344);
    } completion:^(BOOL finished) {
        [self.dimView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
}





@end














