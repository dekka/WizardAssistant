//
//  WASettingsViewController.m
//  WizardAssistant
//
//  Created by Reed Sweeney on 4/25/14.
//  Copyright (c) 2014 Reed Sweeney. All rights reserved.
//

#import "WASettingsViewController.h"
#import "WAEditCell.h"
#import "WAAddPlayerCell.h"
#import "WAPlayer.h"
#import "WAViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface WASettingsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic) BOOL isEditing;

@end

@implementation WASettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.isEDHOn)
    {
        self.edhSwitch.On = YES;
    }
    else
    {
        self.edhSwitch.On = NO;
    }

    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_isEditing) {
        return MIN(self.players.count, 6);
    } else {
        return MIN(self.players.count + 1, 6);
    }
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"Selected Row: %d", indexPath.row);
    if (!_isEditing) {
        if ((indexPath.row == self.players.count) && indexPath.row < 6) {
            WAPlayer *newPlayer = [WAPlayer new];
            [_players addObject:newPlayer];
            _isEditing = YES;
            [_collectionView reloadData];
            //        [_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.players.count inSection:0]]];
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.players.count && !_isEditing && self.players.count < 6)
    {
        WAAddPlayerCell *addPlayerCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddPlayerCell" forIndexPath:indexPath];
        
        addPlayerCell.backgroundColor = [UIColor redColor];
        
        return addPlayerCell;
        
    }
    else
    {
        WAEditCell *editCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EditCell" forIndexPath:indexPath];
        WAPlayer *player = self.players[indexPath.row];
        editCell.nameField.text = player.name;
        
        editCell.layer.borderWidth = 1.0f;
        editCell.layer.borderColor = [UIColor blueColor].CGColor;
        
        return editCell;
    }
    
}

- (IBAction)removePlayer:(id)sender
{
    
    [self.players removeObjectAtIndex:[[[self.collectionView indexPathsForSelectedItems] firstObject]row]];
//    NSLog(@"button pressed");
//    NSLog(@" %d",self.players.count);
    _isEditing = NO;
    [self.collectionView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    WAPlayer *player = [self.players objectAtIndex:_players.count-1];
    [player setupPlayerWithName:textField.text];
    _isEditing = NO;
    [textField resignFirstResponder];
    
    [_collectionView reloadData];
    return YES;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)handleExit:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)edhSwitchChanged:(id)sender
{
    if (self.gameHasStarted)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoa Playa" message:@"You need to reset your game first" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alertView show];
        [self.edhSwitch setOn:(!self.edhSwitch.on) animated:YES];
    }
    else
    {
    [self.delegate edhModeChanged];
    }
    
    
}

- (IBAction)addFivePlayers:(id)sender
{
    WAPlayer *newPlayer = [WAPlayer new];
    [_players addObject:newPlayer];
    [_players addObject:newPlayer];
    [_players addObject:newPlayer];
    [_players addObject:newPlayer];
    [_players addObject:newPlayer];
    [self.collectionView reloadData];
}



@end














