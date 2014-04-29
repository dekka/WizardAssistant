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
    if (self.stepperOne == sender) {
        double value = [sender value];
        double currentValue = [self.damageOne.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageOne setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageOne.text intValue] - [self.playerCell.commanderOne.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderOne setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        //subtract this number from playerHealth
        
    } else if (self.stepperTwo == sender) {
        double value = [sender value];
        double currentValue = [self.damageTwo.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageTwo setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageTwo.text intValue] - [self.playerCell.commanderTwo.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderTwo setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        
    } else if (self.stepperThree == sender) {
        double value = [sender value];
        double currentValue = [self.damageThree.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageThree setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageThree.text intValue] - [self.playerCell.commanderThree.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderThree setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        
    } else if (self.stepperFour == sender) {
        double value = [sender value];
        double currentValue = [self.damageFour.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageFour setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageFour.text intValue] - [self.playerCell.commanderFour.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderFour setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        
    } else if (self.stepperFive == sender) {
        double value = [sender value];
        double currentValue = [self.damageFive.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageFive setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageFive.text intValue] - [self.playerCell.commanderFive.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderFive setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        
    } else if (self.stepperSix == sender) {
        double value = [sender value];
        double currentValue = [self.damageSix.text doubleValue];
        currentValue +=value;
        sender.value = 0;
        [self.damageSix setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
        int changeInHealth = ([self.damageSix.text intValue] - [self.playerCell.commanderSix.text intValue]);
        [self.playerCell.playerHealth setText:[NSString stringWithFormat:@"%d", ([self.playerCell.playerHealth.text intValue] - (int)changeInHealth)]];
        [self.playerCell.commanderSix setText:[NSString stringWithFormat:@"%d", (int)currentValue]];
    }

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














