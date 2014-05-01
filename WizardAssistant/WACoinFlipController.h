//
//  WACoinFlipController.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WACoinFlipController : UIView

@property (nonatomic, weak) UIView *dimView;
@property (weak, nonatomic) IBOutlet UIImageView *coinImageTails;
@property (weak, nonatomic) IBOutlet UIImageView *coinImageHeads;
@property (weak, nonatomic) IBOutlet UILabel *headsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tailsLabel;

- (void)setupCoinFlipViewWithDimView:(UIView *)dimView;

@end
