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

@interface WAViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) WAPlayerCell *playerCell;
@property (nonatomic, strong) WAEditCell *editCell;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) WACommanderDamageView *commanderDamageView;

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
    
    [playerCell setupCommanderDamageWithPlayerCount:_players.count];
    
    playerCell.backgroundColor = [UIColor orangeColor];
    playerCell.increaseLifeButton.tag = indexPath.row;
    playerCell.decreaseLifeButton.tag = indexPath.row;
    playerCell.playerName.text = player.name;
    
    
    return playerCell;
    
}





- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    WAPlayerCell *cellTapped = (WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    CGPoint pointInCell = [gestureRecognizer locationInView:cellTapped];
//    NSLog(@"j: %@",NSStringFromCGPoint(pointInCell));
    
    if (pointInCell.y < 75)
    {
        [self damageUpForCell:cellTapped];
    } else if (pointInCell.y > 76)
    {
        [self damageDownForCell:cellTapped];
    }
    
}

- (void)damageUpForCell:(WAPlayerCell *)cellTapped
{
    int playerHealthIncreased = [cellTapped.playerHealth.text intValue];
    playerHealthIncreased += 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthIncreased];
    
}

- (void)damageDownForCell:(WAPlayerCell *)cellTapped
{
    int playerHealthDecreased = [cellTapped.playerHealth.text intValue];
    playerHealthDecreased -= 1;
    cellTapped.playerHealth.text = [NSString stringWithFormat:@"%d",playerHealthDecreased];
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        gestureRecognizer.enabled = NO;
        gestureRecognizer.enabled = YES;
        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        
        self.commanderDamageView = [[WACommanderDamageView alloc] initWithFrame:CGRectMake(15, -320, 290, 290)];
        [self.commanderDamageView setupCommanderDamageView:_players.count WithCell:(WAPlayerCell *)[self.collectionView cellForItemAtIndexPath:indexPath]];
        [self.view addSubview:self.commanderDamageView];
        
        [UIView animateWithDuration:.3 animations:^{
            self.commanderDamageView.frame = CGRectMake(15, 30, 290, 290);
        }];
        
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
    }
    
}






@end






