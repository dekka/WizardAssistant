//
//  WACommanderDamage.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/30/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WACommanderDamage.h"

@implementation WACommanderDamage

-(id)init
{
    self = [super init];
    if (self)
    {
        self.damage = 0;
    }
    

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    self.damage = [aDecoder decodeIntegerForKey:@"damage"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.damage forKey:@"damage"];
}

@end
