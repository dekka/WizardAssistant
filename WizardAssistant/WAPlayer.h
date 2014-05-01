//
//  WAPlayer.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/28/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAPlayer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger health;
@property (nonatomic, strong) NSMutableArray *commanderDamages;
@property (nonatomic) NSInteger poisonDamageTaken;

- (void)setupPlayerWithName:(NSString *)name;
- (void)resetPlayerForEDH:(BOOL)isEDH;

@end
