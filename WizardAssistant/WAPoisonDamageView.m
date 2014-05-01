//
//  WAPoisonDamageView.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WAPoisonDamageView.h"

@implementation WAPoisonDamageView

- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"PoisonDamage" owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupPoisonDamageViewWithCell:(WAPlayerCell *)playerCell andPlayer:(WAPlayer *)player andWithDimView:(UIView *)dimView
{
    self.playerCell = playerCell;
    self.
    self.dimView = dimView;
    
    if (self.poisonDamageLabel)
    {
        self.poisonDamageLabel.text = self.playerCell.poisonDamage.text;
    }
}

- (IBAction)poisonStepperPressed:(UIStepper *)sender
{
    double poisonValue = [sender value];
    double currentPoisonValue = [self.poisonDamageLabel.text doubleValue];
    currentPoisonValue += poisonValue;
    sender.value = 0;
    [self.poisonDamageLabel setText:[NSString stringWithFormat:@"%d", (int)currentPoisonValue]];
    [self.playerCell.poisonDamage setText:[NSString stringWithFormat:@"%d",(int)currentPoisonValue]];
    self.playerCell.poisonDamage.hidden = NO;
    self.selectedPlayer.poisonDamageTaken = currentPoisonValue;
    

}

- (IBAction)closeWindow:(id)sender
{
    [UIView animateWithDuration:.3 animations:^{
        
        self.frame = CGRectMake(15, -180, 290, 180);
    } completion:^(BOOL finished) {
        [self.dimView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
