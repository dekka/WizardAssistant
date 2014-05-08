//
//  WAEditCell.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WAEditCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *removePlayerButton;

@end
