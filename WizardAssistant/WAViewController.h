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

- (void)damageUpForCell:(WAPlayerCell *)cellTapped;
- (void)damageDownForCell:(WAPlayerCell *)cellTapped;

@end
