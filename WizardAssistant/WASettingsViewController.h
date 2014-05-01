//
//  WASettingsViewController.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@protocol WASettingsViewControllerDelegate <NSObject>

- (void)edhModeChanged;

@end

@interface WASettingsViewController : UIViewController

@property (nonatomic) NSInteger numberOfPlayers;
@property (nonatomic, weak) NSMutableArray *players;
@property (nonatomic, strong) IBOutlet UISwitch *edhSwitch;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, unsafe_unretained) id <WASettingsViewControllerDelegate> delegate;


@end
