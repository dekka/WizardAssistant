//
//  WASettingsViewController.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WASettingsViewController : UIViewController

@property (nonatomic) NSInteger numberOfPlayers;
@property (nonatomic, weak) NSMutableArray *players;

@end
