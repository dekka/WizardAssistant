//
//  GameModel.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    self.players = [aDecoder decodeObjectForKey:@"players"];
    self.gameInProgress = [aDecoder decodeBoolForKey:@"gameInProgress"];
    self.formatIsEdh = [aDecoder decodeBoolForKey:@"formatIsEdh"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.players forKey:@"players"];
    [aCoder encodeBool:self.gameInProgress forKey:@"gameInProgress"];
    [aCoder encodeBool:self.formatIsEdh forKey:@"formatIsEdh"];
}

@end
