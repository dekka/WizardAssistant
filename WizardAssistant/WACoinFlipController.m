//
//  WACoinFlipController.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WACoinFlipController.h"
#import "WAViewController.h"

@implementation WACoinFlipController

- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"CoinFlipView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCoinFlipViewWithDimView:(UIView *)dimView
{
    self.dimView = dimView;
    NSInteger c = arc4random_uniform(2);
    if (c == 0)
    {
        self.coinImageHeads.hidden = NO;
        self.headsLabel.hidden = NO;
    } else if (c == 1)
    {
        self.coinImageTails.hidden = NO;
        self.tailsLabel.hidden = NO;
    }
}

- (IBAction)closeWindow:(id)sender
{
    [UIView animateWithDuration:.4 animations:^{
        
        self.frame = CGRectMake(0, -200, 200, 200);
    } completion:^(BOOL finished) {
        [self.dimView removeFromSuperview];
        [self removeFromSuperview];
        self.coinImageHeads.hidden = YES;
        self.coinImageTails.hidden = YES;
        self.headsLabel.hidden = YES;
        self.tailsLabel.hidden = YES;
    }];

    
}


@end



