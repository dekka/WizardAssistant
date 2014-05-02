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
    
    //// Frames
    CGRect playerPanelFrame = CGRectMake(0, 0, 150, 150);
    
    
    //// PlayerPanel
    {
        //// PanelBottom Drawing
        UIBezierPath* panelBottomPath = [UIBezierPath bezierPath];
        [panelBottomPath moveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 140.01, CGRectGetMinY(playerPanelFrame) + 149.5)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 9.71, CGRectGetMinY(playerPanelFrame) + 149.5) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 96.58, CGRectGetMinY(playerPanelFrame) + 149.5) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 53.14, CGRectGetMinY(playerPanelFrame) + 149.5)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 8.88, CGRectGetMinY(playerPanelFrame) + 149.15) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 9.55, CGRectGetMinY(playerPanelFrame) + 149.12) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 9.16, CGRectGetMinY(playerPanelFrame) + 149.23)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.38, CGRectGetMinY(playerPanelFrame) + 140.86) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 4.47, CGRectGetMinY(playerPanelFrame) + 147.92) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 1.65, CGRectGetMinY(playerPanelFrame) + 145.16)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.03, CGRectGetMinY(playerPanelFrame) + 140.05) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.3, CGRectGetMinY(playerPanelFrame) + 140.59) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.41, CGRectGetMinY(playerPanelFrame) + 140.21)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame), CGRectGetMinY(playerPanelFrame) + 76.1) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.03, CGRectGetMinY(playerPanelFrame) + 118.74) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.03, CGRectGetMinY(playerPanelFrame) + 97.42)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 1.13, CGRectGetMinY(playerPanelFrame) + 75) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) - 0, CGRectGetMinY(playerPanelFrame) + 75.18) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.19, CGRectGetMinY(playerPanelFrame) + 75)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 148.87, CGRectGetMinY(playerPanelFrame) + 75) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 50.38, CGRectGetMinY(playerPanelFrame) + 75.03) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 99.62, CGRectGetMinY(playerPanelFrame) + 75.03)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 150, CGRectGetMinY(playerPanelFrame) + 76.11) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.81, CGRectGetMinY(playerPanelFrame) + 75) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 150, CGRectGetMinY(playerPanelFrame) + 75.18)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.97, CGRectGetMinY(playerPanelFrame) + 140.05) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.96, CGRectGetMinY(playerPanelFrame) + 97.42) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.97, CGRectGetMinY(playerPanelFrame) + 118.74)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.45, CGRectGetMinY(playerPanelFrame) + 141.37) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.53, CGRectGetMinY(playerPanelFrame) + 140.39) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.6, CGRectGetMinY(playerPanelFrame) + 140.93)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 144.28, CGRectGetMinY(playerPanelFrame) + 147.87) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 148.56, CGRectGetMinY(playerPanelFrame) + 144.18) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 146.83, CGRectGetMinY(playerPanelFrame) + 146.32)];
        [panelBottomPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 140.01, CGRectGetMinY(playerPanelFrame) + 149.5) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 142.95, CGRectGetMinY(playerPanelFrame) + 148.68) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 141.43, CGRectGetMinY(playerPanelFrame) + 148.95)];
        [panelBottomPath closePath];
        panelBottomPath.miterLimit = 4;
        
        [self.bottomColor setFill];
        [panelBottomPath fill];
        
        
        //// PanelTop Drawing
        UIBezierPath* panelTopPath = [UIBezierPath bezierPath];
        [panelTopPath moveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 10.82, CGRectGetMinY(playerPanelFrame))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 139.18, CGRectGetMinY(playerPanelFrame)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 53.61, CGRectGetMinY(playerPanelFrame)) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 96.39, CGRectGetMinY(playerPanelFrame))];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.97, CGRectGetMinY(playerPanelFrame) + 10.6) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 145.42, CGRectGetMinY(playerPanelFrame) + 0.94) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.02, CGRectGetMinY(playerPanelFrame) + 4.47)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 150, CGRectGetMinY(playerPanelFrame) + 73.38) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.97, CGRectGetMinY(playerPanelFrame) + 31.53) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.97, CGRectGetMinY(playerPanelFrame) + 52.46)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 148.87, CGRectGetMinY(playerPanelFrame) + 74.5) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 150, CGRectGetMinY(playerPanelFrame) + 74.31) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 149.81, CGRectGetMinY(playerPanelFrame) + 74.5)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 1.13, CGRectGetMinY(playerPanelFrame) + 74.5) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 99.62, CGRectGetMinY(playerPanelFrame) + 74.47) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 50.38, CGRectGetMinY(playerPanelFrame) + 74.47)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame), CGRectGetMinY(playerPanelFrame) + 73.38) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.19, CGRectGetMinY(playerPanelFrame) + 74.5) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame), CGRectGetMinY(playerPanelFrame) + 74.31)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.03, CGRectGetMinY(playerPanelFrame) + 10.87) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.04, CGRectGetMinY(playerPanelFrame) + 52.55) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.03, CGRectGetMinY(playerPanelFrame) + 31.71)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 1.17, CGRectGetMinY(playerPanelFrame) + 6.59) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.18, CGRectGetMinY(playerPanelFrame) + 9.39) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 0.5, CGRectGetMinY(playerPanelFrame) + 7.94)];
        [panelTopPath addCurveToPoint: CGPointMake(CGRectGetMinX(playerPanelFrame) + 10.82, CGRectGetMinY(playerPanelFrame)) controlPoint1: CGPointMake(CGRectGetMinX(playerPanelFrame) + 3.13, CGRectGetMinY(playerPanelFrame) + 2.62) controlPoint2: CGPointMake(CGRectGetMinX(playerPanelFrame) + 6.47, CGRectGetMinY(playerPanelFrame) + 0.59)];
        [panelTopPath closePath];
        panelTopPath.miterLimit = 4;
        
        [self.topColor setFill];
        [panelTopPath fill];
    }
    
    
}


@end
