//
//  WAPlayerCell.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAPlayer.h"
#import "PlayerCelPanelView.h"

@interface WAPlayerCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *playerHealth;
@property (nonatomic, weak) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *commanderOne;
@property (weak, nonatomic) IBOutlet UILabel *commanderTwo;
@property (weak, nonatomic) IBOutlet UILabel *commanderThree;
@property (weak, nonatomic) IBOutlet UILabel *commanderFour;
@property (weak, nonatomic) IBOutlet UILabel *commanderFive;
@property (weak, nonatomic) IBOutlet UILabel *commanderSix;
@property (nonatomic, strong) NSMutableArray *commanderLabels;
@property (weak, nonatomic) IBOutlet UILabel *poisonDamage;

- (void)setupCommanderDamageWithPlayerCount:(int)playerCount AndPlayer:(WAPlayer *)player atIndexPath:(NSIndexPath *)indexPath;
- (void)setupStandardFormatCellsWithPlayer:(WAPlayer *)player atIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, weak) IBOutlet PlayerCelPanelView *panelView;

@end
