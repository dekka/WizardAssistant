//
//  WAViewController.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/21/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WAViewController.h"
#import "WAEditCell.h"
#import "WASettingsViewController.h"
#import "WAPlayer.h"
#import "WACommanderDamageView.h"
#import "WAPoisonDamageView.h"

@interface WAViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, WASettingsViewControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) WAPlayerCell *playerCell;
@property (nonatomic, strong) WAEditCell *editCell;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) WACommanderDamageView *commanderDamageView;
@property (nonatomic, strong) WAPoisonDamageView *poisonDamageView;
@property (nonatomic) BOOL gameStarted;

@end

@implementation WAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    _players = [NSMutableArray new];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.5;
    lpgr.delegate = self;
    lpgr.cancelsTouchesInView = YES;
    lpgr.delaysTouchesEnded = YES;
    [self.collectionView addGestureRecognizer:lpgr];
    
    UITapGestureRecognizer *tapDamage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapDamage.delegate = self;
    [self.collectionView addGestureRecognizer:tapDamage];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!_players.count) {
        [self performSegueWithIdentifier:@"ToSettings" sender:self];
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _players.count;
}

- (WAPlayerCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WAPlayer *player = [_players objectAtIndex:indexPath.row];
    
    
    
    WAPlayerCell *playerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    if (_isEDH)
    {
        [playerCell setupCommanderDamageWithPlayerCount:_players.count AndPlayer:player];
    } else {
        [playerCell setupStandardFormatCellsWithPlayer:player];
    }
    
    
    playerCell.playerName.text = player.name;
    playerCell.playerHealth.text = [NSString stringWithFormat:@"%ld",(long)player.health];
    
    
    return playerCell;
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self resetGameActually];
    }
}

- (IBAction)resetGame:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoa Bro" message:@"Are you sure you want to reset the game?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    alertView.delegate = self;

    [alertView show];
}

-(void)resetGameActually
{
    for (WAPlayer *player in self.players)
    {
        [player resetPlayerForEDH:self.isEDH];
    }
    [self.collectionView reloadData];
    self.gameStarted = NO;
}

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer
{
    self.gameStarted = YES;
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    WAPlayerCell *cellTapped = (WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    WAPlayer *player = self.players[indexPath.row];
    CGPoint pointInCell = [gestureRecognizer locationInView:cellTapped];
//    NSLog(@"j: %@",NSStringFromCGPoint(pointInCell));
    
    if (pointInCell.y < 75)
    {
        [self damageUpForCell:cellTapped andPlayer:player];
    } else if (pointInCell.y > 76)
    {
        [self damageDownForCell:cellTapped andPlayer:player];
    }
    
}

- (void)damageUpForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player
{
    int playerHealthIncreased = [cellTapped.playerHealth.text intValue];
    playerHealthIncreased += 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthIncreased];
    player.health = playerHealthIncreased;
    
}

- (void)damageDownForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player
{
    int playerHealthDecreased = [cellTapped.playerHealth.text intValue];
    playerHealthDecreased -= 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthDecreased];
    player.health = playerHealthDecreased;
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        self.gameStarted = YES;
        gestureRecognizer.enabled = NO;
        gestureRecognizer.enabled = YES;
        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        WAPlayer *selectedPlayer = self.players[indexPath.row];
        
        UIView *dimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        dimView.backgroundColor = [UIColor blackColor];
        dimView.alpha = 0.7f;
        dimView.tag = 1111;
        dimView.userInteractionEnabled = NO;
        [self.view addSubview:dimView];
        
        if (_isEDH)
        {
            self.commanderDamageView = [[WACommanderDamageView alloc] initWithFrame:CGRectMake(15, -320, 290, 344)];
            self.commanderDamageView.alpha = 0.9f;
            
            [self.commanderDamageView setupCommanderDamageView:_players WithCell:(WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath] andPlayer:selectedPlayer andWithDimView:dimView];
            [self.view addSubview:self.commanderDamageView];
            
            [UIView animateWithDuration:.3 animations:^{
                self.commanderDamageView.frame = CGRectMake(15, 30, 290, 344);
            }];
        } else
        {
            self.poisonDamageView = [[WAPoisonDamageView alloc] initWithFrame:CGRectMake(15, -180, 290, 180)];
            self.poisonDamageView.alpha = 0.9f;
            
            [self.poisonDamageView setupPoisonDamageViewWithCell:(WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath] andPlayer:selectedPlayer andWithDimView:dimView];
            [self.view addSubview:self.poisonDamageView];
            [UIView animateWithDuration:.3 animations:^{
                self.poisonDamageView.frame = CGRectMake(15, 30, 290, 180);
            }];
        }
    }
}


//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if ([touch.view isKindOfClass:[WAPlayerCell class]])
//        {
//            return NO;
//        }
//        return YES;
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToSettings"]) {
        WASettingsViewController *settingsController = (WASettingsViewController *)segue.destinationViewController;
        settingsController.players = self.players;
        settingsController.delegate = self;
        settingsController.isEDHOn = (_isEDH);
        settingsController.gameHasStarted = self.gameStarted;
        
    }
    
}

- (void)edhModeChanged
{
    if (_isEDH)
    {
        _isEDH = NO;
        for (WAPlayer *player in self.players)
        {
            player.health = 20;
            player.poisonDamageTaken = 0;
        }
        
    } else{
        _isEDH = YES;
        for (WAPlayer *player in self.players)
        {
            player.health = 40;
            player.poisonDamageTaken = 0;
        }
    }
}






@end






