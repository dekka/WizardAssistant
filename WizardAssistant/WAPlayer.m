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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.health = [aDecoder decodeIntegerForKey:@"health"];
    self.commanderDamages = [aDecoder decodeObjectForKey:@"commanderDamages"];
    self.poisonDamageTaken = [aDecoder decodeIntegerForKey:@"poisonDamageTaken"];
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.health forKey:@"health"];
    [aCoder encodeObject:self.commanderDamages forKey:@"commanderDamages"];
    [aCoder encodeInteger:self.poisonDamageTaken forKey:@"poisonDamageTaken"];
    
}


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
