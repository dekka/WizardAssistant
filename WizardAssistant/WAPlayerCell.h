//
//  WAPlayerCell.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAPlayerCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIButton *increaseLifeButton;
@property (nonatomic, weak) IBOutlet UIButton *decreaseLifeButton;
@property (weak, nonatomic) IBOutlet UILabel *playerHealth;
@property (nonatomic, weak) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *commanderOne;
@property (weak, nonatomic) IBOutlet UILabel *commanderTwo;
@property (weak, nonatomic) IBOutlet UILabel *commanderThree;
@property (weak, nonatomic) IBOutlet UILabel *commanderFour;
@property (weak, nonatomic) IBOutlet UILabel *commanderFive;
@property (weak, nonatomic) IBOutlet UILabel *commanderSix;
@property (nonatomic, strong) NSMutableArray *commanderLabels;

- (void)setupCommanderDamageWithPlayerCount:(int)playerCount;

@end
