//
//  WAPoisonDamageView.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAPlayerCell.h"
#import "WAPlayer.h"


@interface WAPoisonDamageView : UIView

@property (nonatomic, weak) WAPlayerCell *playerCell;
@property (nonatomic, weak) UIView *dimView;
@property (weak, nonatomic) IBOutlet UILabel *poisonDamageLabel;
@property (weak, nonatomic) IBOutlet UIStepper *poisonStepper;
@property (nonatomic, weak) WAPlayer *selectedPlayer;

- (void)setupPoisonDamageViewWithCell:(WAPlayerCell *)playerCell andPlayer:(WAPlayer *)player andWithDimView:(UIView *)dimView;


@end
