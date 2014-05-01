//
//  GameModel.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WAPlayer.h"

@interface GameModel : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic) BOOL gameInProgress;
@property (nonatomic) BOOL formatIsEdh;

@end
