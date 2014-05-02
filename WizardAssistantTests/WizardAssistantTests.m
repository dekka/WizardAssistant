//
//  WizardAssistantTests.m
//  WizardAssistantTests
//
//  Created by Reed Sweeney on 4/21/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WAPlayer.h"
@interface WizardAssistantTests : XCTestCase

@property (nonatomic, strong) WAPlayer *player;
@end

@implementation WizardAssistantTests

- (void)setUp
{
    [super setUp];
    _player = [[WAPlayer alloc] init];
}


- (void)tearDown
{
    _player = nil;
    
    [super tearDown];
}

- (void)testPlayerHealthAfterChangingGameModeToEDH
{
    [_player resetPlayerForEDH:YES];
    
    XCTAssertEqual(_player.health, 40, @"Players should have 40 health when reset to EDH mode");
}

- (void)testPlayerHealthAfterChangingGameModeToStandard
{
    [_player resetPlayerForEDH:NO];
    
    XCTAssertEqual(_player.health, 20, @"Players should have 20 health when reset to Standard mode");
    
}

- (void)testExample
{
    NSString *testString = @"Reed";
    NSString *testStringTwo = @"Sweeney";
    testStringTwo = testString;
    XCTAssertEqual(testString, testStringTwo, @"these two strings should be equal");

}

@end
