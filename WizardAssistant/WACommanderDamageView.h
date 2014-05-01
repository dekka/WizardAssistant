//
//  WACommanderDamageView.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/28/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAPlayerCell.h"

@interface WACommanderDamageView : UIView
@property (weak, nonatomic) IBOutlet UILabel *playerOne;
@property (weak, nonatomic) IBOutlet UILabel *playerTwo;
@property (weak, nonatomic) IBOutlet UILabel *playerThree;
@property (weak, nonatomic) IBOutlet UILabel *playerFour;
@property (weak, nonatomic) IBOutlet UILabel *playerFive;
@property (weak, nonatomic) IBOutlet UILabel *playerSix;
@property (weak, nonatomic) IBOutlet UILabel *damageOne;
@property (weak, nonatomic) IBOutlet UILabel *damageTwo;
@property (weak, nonatomic) IBOutlet UILabel *damageThree;
@property (weak, nonatomic) IBOutlet UILabel *damageFour;
@property (weak, nonatomic) IBOutlet UILabel *damageFive;
@property (weak, nonatomic) IBOutlet UILabel *damageSix;
@property (weak, nonatomic) IBOutlet UILabel *poisonDamage;
@property (weak, nonatomic) IBOutlet UIStepper *stepperOne;
@property (weak, nonatomic) IBOutlet UIStepper *stepperTwo;
@property (weak, nonatomic) IBOutlet UIStepper *stepperThree;
@property (weak, nonatomic) IBOutlet UIStepper *stepperFour;
@property (weak, nonatomic) IBOutlet UIStepper *stepperFive;
@property (weak, nonatomic) IBOutlet UIStepper *stepperSix;
@property (weak, nonatomic) IBOutlet UIStepper *poisonStepper;
@property (nonatomic, strong) NSMutableArray *commanderLabels;
@property (nonatomic, strong) NSMutableArray *commanderDamageLabels;
@property (nonatomic, strong) NSMutableArray *commanderDamageSteppers;
@property (nonatomic, weak) WAPlayerCell *playerCell;
@property (nonatomic,weak) UIView *dimView;
@property (nonatomic,weak) WAPlayer *selectedPlayer;

- (void)setupCommanderDamageView:(NSMutableArray *)players WithCell:(WAPlayerCell *)playerCell andPlayer:(WAPlayer *)player andWithDimView:(UIView *)dimView;

@end
