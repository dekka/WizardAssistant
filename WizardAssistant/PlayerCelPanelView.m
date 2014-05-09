//
//  PlayerCelPanelView.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 5/1/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "PlayerCelPanelView.h"

@interface PlayerCelPanelView ()

@property (nonatomic, strong) UIColor *topColor;
@property (nonatomic, strong) UIColor *bottomColor;
@end

@implementation PlayerCelPanelView

- (instancetype)initWithFrame:(CGRect)frame andColorScheme:(kPlayerCellColorScheme)colorScheme
{
    self = [super initWithFrame:frame];
    if (self) {
        self.colorScheme = colorScheme;
    }
    
    return self;
}

- (void)setColorScheme:(kPlayerCellColorScheme)colorScheme
{
    _colorScheme = colorScheme;
    switch (_colorScheme) {
        case kPlayerCellColorSchemeBlue:
            self.topColor = [UIColor colorWithRed:0.451 green:0.714 blue:0.886 alpha:1];
            self.bottomColor = [UIColor colorWithRed:0.467 green:0.675 blue:0.812 alpha:1];
            break;
        case kPlayerCellColorSchemeOrange:
            self.topColor = [UIColor colorWithRed: 0.882 green: 0.616 blue: 0.389 alpha: 1];
            self.bottomColor = [UIColor colorWithRed: 0.824 green: 0.502 blue: 0.302 alpha: 1];;
            break;
        case kPlayerCellColorSchemePurple:
            self.topColor = [UIColor colorWithRed:0.733 green:0.588 blue:0.812 alpha:1];
            self.bottomColor = [UIColor colorWithRed:0.706 green:0.537 blue:0.784 alpha:1];
            break;
        case kPlayerCellColorSchemeRed:
            self.topColor = [UIColor colorWithRed:0.914 green:0.557 blue:0.518 alpha:1];
            self.bottomColor = [UIColor colorWithRed:0.824 green:0.514 blue:0.478 alpha:1];
            break;
        case kPlayerCellColorSchemeTurqoise:
            self.topColor = [UIColor colorWithRed:0.431 green:0.820 blue:0.745 alpha:1];
            self.bottomColor = [UIColor colorWithRed:0.424 green:0.753 blue:0.690 alpha:1];
            break;
        case kPlayerCellColorSchemeYellow:
            self.topColor = [UIColor colorWithRed:0.937 green:0.839 blue:0.412 alpha:1];
            self.bottomColor = [UIColor colorWithRed:0.941 green:0.745 blue:0.420 alpha:1];
            break;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
//    UIColor* orangeBot = [UIColor colorWithRed: 0.824 green: 0.502 blue: 0.302 alpha: 1];
//    UIColor* orangeTop = [UIColor colorWithRed: 0.882 green: 0.616 blue: 0.389 alpha: 1];
    
    //// Frames
    CGRect playerPanelFrame = self.frame;
    
    //// Subframes
    CGRect playerPanel = CGRectMake(CGRectGetMinX(playerPanelFrame) - 1, CGRectGetMinY(playerPanelFrame), floor((CGRectGetWidth(playerPanelFrame) + 1) * 1.00662 + 0.5), floor((CGRectGetHeight(playerPanelFrame)) * 1.00000 + 0.5));
    
    //// PlayerPanel
    {
        //// PanelBottom Drawing
        UIBezierPath* panelBottomPath = [UIBezierPath bezierPath];
        [panelBottomPath moveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.92772 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99664 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.07046 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99664 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.64197 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99664 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.35621 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99664 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.06499 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99432 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.06941 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99413 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.06686 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99485 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.00910 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93908 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.03601 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.98611 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.01740 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.96772 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.00675 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93368 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00856 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93723 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00929 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93472 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.00658 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50736 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00675 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.79157 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00680 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.64947 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.01403 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50000 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00657 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50122 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00780 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50000 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.98596 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50000 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.33801 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50019 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.66198 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50019 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.99342 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50737 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.99219 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50000 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.99343 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.50122 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.99324 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93369 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.99319 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.64948 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.99324 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.79158 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.98983 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.94249 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.99033 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93592 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.99076 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.93953 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.95578 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.98582 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.98395 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.96118 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.97256 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.97547 * CGRectGetHeight(playerPanel))];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.92772 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99664 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.94707 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99120 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.93707 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.99303 * CGRectGetHeight(playerPanel))];
        [panelBottomPath closePath];
        panelBottomPath.miterLimit = 4;
        
        [self.bottomColor setFill];
        [panelBottomPath fill];
        
        
        //// PanelTop Drawing
        UIBezierPath* panelTopPath = [UIBezierPath bezierPath];
        [panelTopPath moveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.07774 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00000 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.92226 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00000 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.35925 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00000 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.64076 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00000 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.99325 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.07066 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.96330 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00626 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.98700 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.02978 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.99342 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.48923 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.99325 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.21018 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.99320 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.34971 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.98597 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49664 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.99343 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49543 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.99220 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49664 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.01403 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49664 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.66199 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49645 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.33801 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49645 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.00658 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.48923 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00780 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49665 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00657 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.49543 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.00675 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.07248 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00681 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.35032 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00675 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.21140 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.01428 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.04392 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.00778 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.06257 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.00989 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.05292 * CGRectGetHeight(playerPanel))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanel) + 0.07774 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00000 * CGRectGetHeight(playerPanel)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanel) + 0.02718 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.01749 * CGRectGetHeight(playerPanel)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanel) + 0.04912 * CGRectGetWidth(playerPanel), CGRectGetMinY(playerPanel) + 0.00394 * CGRectGetHeight(playerPanel))];
        [panelTopPath closePath];
        panelTopPath.miterLimit = 4;
        
        [self.topColor setFill];
        [panelTopPath fill];
    }

}


@end
