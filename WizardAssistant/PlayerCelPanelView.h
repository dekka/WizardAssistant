//
//  PlayerCelPanelView.h
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

typedef NS_OPTIONS(NSUInteger, kPlayerCellColorScheme) {
    kPlayerCellColorSchemeBlue,
    kPlayerCellColorSchemeOrange,
    kPlayerCellColorSchemePurple,
    kPlayerCellColorSchemeRed,
    kPlayerCellColorSchemeTurqoise,
    kPlayerCellColorSchemeYellow
};

#import <UIKit/UIKit.h>

@interface PlayerCelPanelView : UIView

- (instancetype)initWithFrame:(CGRect)frame andColorScheme:(kPlayerCellColorScheme)colorScheme;

@property (nonatomic, readonly) kPlayerCellColorScheme colorScheme;

@end
