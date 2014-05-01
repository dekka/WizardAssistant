//
//  WAPlayer.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/28/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WAPlayer.h"
#import "WACommanderDamage.h"


@implementation WAPlayer


- (void)setupPlayerWithName:(NSString *)name
{
    self.name = name;
    self.health = 20;
    self.poisonDamageTaken = 0;
    self.commanderDamages = [[NSMutableArray alloc] initWithObjects:[WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], nil];
    
    
}

- (void)resetPlayerForEDH:(BOOL)isEDH
{
    if (isEDH)
    {
    self.health = 40;
    }
    else
    {
    self.health = 20;
    
    }
    self.poisonDamageTaken = 0;
    self.commanderDamages = [[NSMutableArray alloc] initWithObjects:[WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], [WACommanderDamage new], nil];
}

@end
