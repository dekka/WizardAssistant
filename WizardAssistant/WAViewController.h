//
//  WAViewController.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/21/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAPlayerCell.h"

@interface WAViewController : UIViewController

@property (nonatomic) BOOL isEDH;


- (void)damageUpForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player;
- (void)damageDownForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player;

@end
