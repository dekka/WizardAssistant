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
#import "WACoinFlipController.h"
#import "GameModel.h"

@interface WAViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, WASettingsViewControllerDelegate, UIAlertViewDelegate, NSCoding, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) WAPlayerCell *playerCell;
@property (nonatomic, strong) WAEditCell *editCell;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) WACommanderDamageView *commanderDamageView;
@property (nonatomic, strong) WAPoisonDamageView *poisonDamageView;
@property (nonatomic, strong) WACoinFlipController *coinFlipView;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic) BOOL isSmallerScreenSize;


@end

@implementation WAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    if (self.view.frame.size.height < 481) {
        self.isSmallerScreenSize = YES;
    }
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.5;
    lpgr.delegate = self;
    lpgr.cancelsTouchesInView = YES;
    lpgr.delaysTouchesEnded = YES;
    [self.collectionView addGestureRecognizer:lpgr];
    
    UITapGestureRecognizer *tapDamage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapDamage.delegate = self;
    [self.collectionView addGestureRecognizer:tapDamage];
    
   
    self.gameModel = [NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]];
    
    if (!self.gameModel)
    {
        self.gameModel = [GameModel new];
    }
    
    
    if (!self.gameModel.players)
    {
        self.gameModel.players = [NSMutableArray new];
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //unarchive
    
    if (!self.gameModel.players.count)
    {
        [self performSegueWithIdentifier:@"ToSettings" sender:self];
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"GameModel.plist"];
}

- (void)savePlayers
{
    [NSKeyedArchiver archiveRootObject:self.gameModel toFile:[self dataFilePath]];
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
    return self.gameModel.players.count;
}

- (WAPlayerCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WAPlayer *player = [self.gameModel.players objectAtIndex:indexPath.row];
    
    WAPlayerCell *playerCell;
    
    if (self.isSmallerScreenSize) {
        playerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SmallerPlayerCell" forIndexPath:indexPath];
    } else {
    
        playerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayerCell" forIndexPath:indexPath];
    }
    if (self.gameModel.formatIsEdh)
    {
        [playerCell setupCommanderDamageWithPlayerCount:self.gameModel.players.count AndPlayer:player atIndexPath:indexPath];
    } else {
        [playerCell setupStandardFormatCellsWithPlayer:player atIndexPath:indexPath];
    }
  
    
    
    playerCell.playerName.text = player.name;
    playerCell.playerHealth.text = [NSString stringWithFormat:@"%ld",(long)player.health];
    
    return playerCell;
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 && alertView.tag != 1)
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
    for (WAPlayer *player in self.gameModel.players)
    {
        [player resetPlayerForEDH:self.gameModel.formatIsEdh];
    }
    [self.collectionView reloadData];
    self.playerCell.poisonDamage.hidden = YES;
    
    self.gameModel.gameInProgress = NO;
}

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer
{
    self.gameModel.gameInProgress = YES;
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    WAPlayerCell *cellTapped = (WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    WAPlayer *player = self.gameModel.players[indexPath.row];
    CGPoint pointInCell = [gestureRecognizer locationInView:cellTapped];
//    NSLog(@"j: %@",NSStringFromCGPoint(pointInCell));
    
    if (self.isSmallerScreenSize) {
        if (pointInCell.y < 65) {
            [self damageUpForCell:cellTapped andPlayer:player];

        } else if (pointInCell.y > 66) {
            [self damageDownForCell:cellTapped andPlayer:player];

        }
    } else {
    if (pointInCell.y < 75)
    {
        [self damageUpForCell:cellTapped andPlayer:player];
    } else if (pointInCell.y > 76)
    {
        [self damageDownForCell:cellTapped andPlayer:player];
    }
    }
}

- (void)damageUpForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player
{
    int playerHealthIncreased = [cellTapped.playerHealth.text intValue];
    playerHealthIncreased += 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthIncreased];
    player.health = playerHealthIncreased;
    [self savePlayers];
    
}

- (void)damageDownForCell:(WAPlayerCell *)cellTapped andPlayer:(WAPlayer *)player
{
    int playerHealthDecreased = [cellTapped.playerHealth.text intValue];
    playerHealthDecreased -= 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthDecreased];
    player.health = playerHealthDecreased;
    [self savePlayers];
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
       
        self.gameModel.gameInProgress = YES;
        gestureRecognizer.enabled = NO;
        gestureRecognizer.enabled = YES;
        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        WAPlayer *selectedPlayer = self.gameModel.players[indexPath.row];
        
        UIView *dimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        dimView.backgroundColor = [UIColor blackColor];
        dimView.alpha = 0.7f;
        dimView.tag = 1111;
        dimView.userInteractionEnabled = NO;
        
        [self.view addSubview:dimView];
        
        if (self.gameModel.formatIsEdh)
        {
            self.commanderDamageView = [[WACommanderDamageView alloc] initWithFrame:CGRectMake(15, -320, 290, 380)];
            self.commanderDamageView.alpha = 0.9f;
            self.commanderDamageView.layer.masksToBounds = YES;
            self.commanderDamageView.layer.cornerRadius = 10.0;
            
            [self.commanderDamageView setupCommanderDamageView:self.gameModel.players WithCell:(WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath] andPlayer:selectedPlayer andWithDimView:dimView];
            [self.view addSubview:self.commanderDamageView];
            
            [UIView animateWithDuration:.3 animations:^{
                self.commanderDamageView.frame = CGRectMake(15, 30, 290, 380);
            }];
        } else
        {
            self.poisonDamageView = [[WAPoisonDamageView alloc] initWithFrame:CGRectMake(15, -180, 290, 180)];
            self.poisonDamageView.alpha = 0.9f;
            self.poisonDamageView.layer.masksToBounds = YES;
            self.poisonDamageView.layer.cornerRadius = 10.0;
            
            [self.poisonDamageView setupPoisonDamageViewWithCell:(WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath] andPlayer:selectedPlayer andWithDimView:dimView];
            [self.view addSubview:self.poisonDamageView];
            [UIView animateWithDuration:.3 animations:^{
                self.poisonDamageView.frame = CGRectMake(15, 30, 290, 180);
            }];
        }
    }
    [self savePlayers];
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
        
        settingsController.gameModel = self.gameModel;
        settingsController.players = self.gameModel.players;
        settingsController.delegate = self;
        settingsController.gameModel.formatIsEdh = self.gameModel.formatIsEdh;
        settingsController.gameModel.gameInProgress = self.gameModel.gameInProgress;
        
    }
    
}

- (void)edhModeChanged
{
    if (self.gameModel.formatIsEdh)
    {
        self.gameModel.formatIsEdh = NO;
        for (WAPlayer *player in self.gameModel.players)
        {
            player.health = 20;
            player.poisonDamageTaken = 0;
        }
        
    } else{
        self.gameModel.formatIsEdh = YES;
        for (WAPlayer *player in self.gameModel.players)
        {
            player.health = 40;
            player.poisonDamageTaken = 0;
        }
    }
}

-(void)disableInterfaceForCoinAndDice
{
      self.collectionView.userInteractionEnabled = NO;
}

-(void)enableInterfaceForCoinAndDice
{
    self.collectionView.userInteractionEnabled = YES;
}

- (IBAction)coinFlipButtonPressed:(id)sender
{
    UIView *dimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    dimView.backgroundColor = [UIColor blackColor];
    dimView.alpha = 0.7f;
    dimView.tag = 1111;
    dimView.userInteractionEnabled = NO;
    
   
    [self.view addSubview:dimView];

    self.coinFlipView = [[WACoinFlipController alloc] initWithFrame:CGRectMake(60, -200, 200, 200)];
    self.coinFlipView.alpha = 0.9f;
    self.coinFlipView.layer.masksToBounds = YES;
    self.coinFlipView.layer.cornerRadius = 10.0;
    [self.coinFlipView setupCoinFlipViewWithDimView:dimView];
    [self.view addSubview:self.coinFlipView];
    [UIView animateWithDuration:0.4 animations:^{
        self.coinFlipView.frame = CGRectMake(60, 100, 200, 200);
    }];
    [self savePlayers];
}

- (IBAction)diceButtonPressed:(id)sender
{
    NSMutableArray *randomArray = [NSMutableArray new];
    [randomArray addObjectsFromArray:self.gameModel.players];
    NSInteger j = arc4random_uniform(randomArray.count);
    WAPlayer *player = [self.gameModel.players objectAtIndex:j];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Random Player is..." message:[NSString stringWithFormat:@"%@!!!",player.name] delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil, nil];
    alertView.tag = 1;
    [alertView show];
    [self savePlayers];

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isSmallerScreenSize)
    {
        return CGSizeMake(150,130);
    }
    else
    {
        return CGSizeMake(150, 148);
    }
}





@end






